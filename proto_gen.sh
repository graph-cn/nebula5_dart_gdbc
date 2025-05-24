# protoc --proto_path=protos --dart_out=grpc:lib/gen protos/google/**/*.proto
protoc --proto_path=protos --dart_out=grpc:lib/src/proto protos/**.proto
