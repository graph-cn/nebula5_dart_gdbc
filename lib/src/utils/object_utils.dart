// Copyright (c) 2023- All bolt_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [neo4j-java-driver](https://github.com/neo4j/neo4j-java-driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// 比较两个列表或可迭代对象是否相等
///
/// [a] 第一个可迭代对象
/// [b] 第二个可迭代对象
bool listEquals(Iterable? a, Iterable? b) {
  // 如果两个都为null则相等
  if (a == null) return b == null;
  if (b == null) return false;

  // 如果长度不同则不相等
  if (a.length != b.length) return false;

  // 同时遍历两个列表比较元素
  final iteratorA = a.iterator;
  final iteratorB = b.iterator;

  while (iteratorA.moveNext()) {
    iteratorB.moveNext();
    final elementA = iteratorA.current;
    final elementB = iteratorB.current;

    // 处理嵌套的可迭代对象
    if (elementA is Iterable && elementB is Iterable) {
      if (!listEquals(elementA, elementB)) return false;
      continue;
    }

    // 比较普通元素
    if (elementA != elementB) return false;
  }

  return true;
}
