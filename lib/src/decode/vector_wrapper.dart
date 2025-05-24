// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **NestedVector 的封装器，维护向量的一些元数据信息，以避免重复解码**
class VectorWrapper {
  /// 字节序
  final Endian _byteOrder;

  /// 嵌套向量
  final ng.NestedVector _vector;

  /// 此向量的子向量
  final List<VectorWrapper> _vectorWrappers = [];

  /// 此向量中的所有值是否都不为 null
  final bool _nullAllSet;

  /// 图 ID 到图元素类型 ID 及其属性名称和属性向量索引的映射，
  /// 对节点向量和边向量有用
  /// graphId -> (nodeTypeId/edgeTypeId -> (属性名 -> 属性向量索引))
  Map<int, Map<int, Map<String, int>>>?
  _graphElementTypeIdAndPropVectorIndexMap;

  /// 路径的元数据信息
  PathSpecialMetaData? _pathSpecialMetaData;

  /// 常量值
  Object? _constValue;

  /// 创建一个向量封装器
  ///
  /// - `vector`: 要封装的嵌套向量
  /// - `order`: 字节序
  VectorWrapper(ng.NestedVector vector, Endian order)
    : _byteOrder = order,
      _vector = vector,
      _nullAllSet = DecodeUtils.isNullBitMapAllSet(vector) {
    for (var vec in vector.nestedVectors) {
      _vectorWrappers.add(VectorWrapper(vec, _byteOrder));
    }
  }

  /// 获取被封装的向量
  ng.NestedVector get vector => _vector;

  /// 获取嵌套向量的数量
  int get numNestedVectors => _vector.numNestedVectors;

  /// 获取向量记录数量
  int get vectorNumRecords => _vector.commonMetaData.numRecords;

  /// 获取向量类型
  VectorType get vectorType => DecodeUtils.getVectorType(_vector);

  /// 获取向量数据
  Uint8List get vectorData => Uint8List.fromList(_vector.vectorData);

  /// 获取特殊元数据
  Uint8List get specialMetaData => Uint8List.fromList(_vector.specialMetaData);

  /// 获取空位图
  Uint8List get nullBitMap => Uint8List.fromList(_vector.nullBitMap);

  /// 获取所有子向量
  List<VectorWrapper> get nestedVectors => _vectorWrappers;

  /// 获取指定索引的子向量
  ///
  /// - `index`: 子向量索引
  /// - 返回: 子向量封装器
  VectorWrapper getVectorWrapper(int index) => _vectorWrappers[index];

  /// 是否所有值都不为 null
  ///
  /// - 返回: 如果所有值都不为 null，则为 true
  bool get isNullAllSet => _nullAllSet;

  /// 设置常量值
  ///
  /// - `value`: 对象值
  set constValue(Object? value) {
    _constValue = value;
  }

  /// 获取常量值
  Object? get constValue => _constValue;

  /// 用于节点向量或边向量
  /// 从向量的特殊元数据构建属性向量索引映射
  ///
  /// - `typeIdSize`: 节点类型 ID 大小(2 字节)或边类型 ID 大小(4 字节)
  /// - 返回: 映射: graphId -> (节点/边类型 ID -> (属性名 -> 属性向量索引))
  Map<int, Map<int, Map<String, int>>>
  getGraphElementTypeIdAndPropVectorIndexMap(int typeIdSize) {
    if (_graphElementTypeIdAndPropVectorIndexMap == null) {
      _graphElementTypeIdAndPropVectorIndexMap = {};
      BytesReader reader = BytesReader(
        Uint8List.fromList(_vector.specialMetaData),
      );

      // 前 4 个字节是所有节点类型或边类型的属性名总数
      int propertyNum = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.int32Size),
        _byteOrder,
      );

      // 计算所有属性名索引并跳过所有属性名的长度
      List<String> propNames = List<String>.filled(propertyNum, '');
      for (int i = 0; i < propertyNum; i++) {
        propNames[i] = reader.readSizedString(_byteOrder);
      }

      // 节点/边类型数量，4 字节
      int typeNum = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.int32Size),
        _byteOrder,
      );

      for (int i = 0; i < typeNum; i++) {
        // 获取图 ID
        int graphId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.graphIdSize),
          _byteOrder,
        );

        // 获取节点/边类型 ID
        final int typeId =
            typeIdSize == 2
                ? DecodeUtils.bytesToInt16(reader.read(typeIdSize), _byteOrder)
                : DecodeUtils.bytesToInt32(reader.read(typeIdSize), _byteOrder);

        int nodePropNum = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.propertyNumSize),
          _byteOrder,
        );

        Map<String, int> propNameToVectorIndex = {};
        for (int j = 0; j < nodePropNum; j++) {
          int propVectorIndex = DecodeUtils.bytesToInt32(
            reader.read(SizeConstant.vectorIndexSize),
            _byteOrder,
          );
          propNameToVectorIndex[propNames[propVectorIndex]] = propVectorIndex;
        }

        if (!_graphElementTypeIdAndPropVectorIndexMap!.containsKey(graphId)) {
          _graphElementTypeIdAndPropVectorIndexMap![graphId] = {};
        }

        _graphElementTypeIdAndPropVectorIndexMap![graphId]![typeId] =
            propNameToVectorIndex;
      }
    }
    return _graphElementTypeIdAndPropVectorIndexMap!;
  }

  /// 用于路径向量
  /// 构建路径的元数据
  ///
  /// - 返回: 路径特殊元数据对象
  PathSpecialMetaData get pathSpecialMetaData {
    if (_pathSpecialMetaData == null) {
      _pathSpecialMetaData = PathSpecialMetaData(_vector, _byteOrder);
    }
    return _pathSpecialMetaData!;
  }
}
