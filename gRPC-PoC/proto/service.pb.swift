// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: service.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// A BlockID message contains identifiers to select a block: a height or a
/// hash. If the hash is present it takes precedence.
struct BlockID {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var height: UInt64 = 0

  var hash: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// BlockRange technically allows ranging from hash to hash etc but this is not
/// currently intended for support, though there is no reason you couldn't do
/// it. Further permutations are left as an exercise.
struct BlockRange {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var start: BlockID {
    get {return _storage._start ?? BlockID()}
    set {_uniqueStorage()._start = newValue}
  }
  /// Returns true if `start` has been explicitly set.
  var hasStart: Bool {return _storage._start != nil}
  /// Clears the value of `start`. Subsequent reads from it will return its default value.
  mutating func clearStart() {_uniqueStorage()._start = nil}

  var end: BlockID {
    get {return _storage._end ?? BlockID()}
    set {_uniqueStorage()._end = newValue}
  }
  /// Returns true if `end` has been explicitly set.
  var hasEnd: Bool {return _storage._end != nil}
  /// Clears the value of `end`. Subsequent reads from it will return its default value.
  mutating func clearEnd() {_uniqueStorage()._end = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// A TxFilter contains the information needed to identify a particular
/// transaction: either a block and an index, or a direct transaction hash.
struct TxFilter {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var block: BlockID {
    get {return _storage._block ?? BlockID()}
    set {_uniqueStorage()._block = newValue}
  }
  /// Returns true if `block` has been explicitly set.
  var hasBlock: Bool {return _storage._block != nil}
  /// Clears the value of `block`. Subsequent reads from it will return its default value.
  mutating func clearBlock() {_uniqueStorage()._block = nil}

  var index: UInt64 {
    get {return _storage._index}
    set {_uniqueStorage()._index = newValue}
  }

  var hash: Data {
    get {return _storage._hash}
    set {_uniqueStorage()._hash = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// RawTransaction contains the complete transaction data.
struct RawTransaction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var data: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SendResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var errorCode: Int32 = 0

  var errorMessage: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Empty placeholder. Someday we may want to specify e.g. a particular chain fork.
struct ChainSpec {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cash.z.wallet.sdk.rpc"

extension BlockID: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BlockID"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "height"),
    2: .same(proto: "hash"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.height)
      case 2: try decoder.decodeSingularBytesField(value: &self.hash)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.height != 0 {
      try visitor.visitSingularUInt64Field(value: self.height, fieldNumber: 1)
    }
    if !self.hash.isEmpty {
      try visitor.visitSingularBytesField(value: self.hash, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: BlockID, rhs: BlockID) -> Bool {
    if lhs.height != rhs.height {return false}
    if lhs.hash != rhs.hash {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension BlockRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BlockRange"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "start"),
    2: .same(proto: "end"),
  ]

  fileprivate class _StorageClass {
    var _start: BlockID? = nil
    var _end: BlockID? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _start = source._start
      _end = source._end
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._start)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._end)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._start {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._end {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: BlockRange, rhs: BlockRange) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._start != rhs_storage._start {return false}
        if _storage._end != rhs_storage._end {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TxFilter: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TxFilter"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "block"),
    2: .same(proto: "index"),
    3: .same(proto: "hash"),
  ]

  fileprivate class _StorageClass {
    var _block: BlockID? = nil
    var _index: UInt64 = 0
    var _hash: Data = SwiftProtobuf.Internal.emptyData

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _block = source._block
      _index = source._index
      _hash = source._hash
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._block)
        case 2: try decoder.decodeSingularUInt64Field(value: &_storage._index)
        case 3: try decoder.decodeSingularBytesField(value: &_storage._hash)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._block {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._index != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._index, fieldNumber: 2)
      }
      if !_storage._hash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._hash, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: TxFilter, rhs: TxFilter) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._block != rhs_storage._block {return false}
        if _storage._index != rhs_storage._index {return false}
        if _storage._hash != rhs_storage._hash {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension RawTransaction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RawTransaction"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.data)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: RawTransaction, rhs: RawTransaction) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension SendResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SendResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "errorCode"),
    2: .same(proto: "errorMessage"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.errorCode)
      case 2: try decoder.decodeSingularStringField(value: &self.errorMessage)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.errorCode != 0 {
      try visitor.visitSingularInt32Field(value: self.errorCode, fieldNumber: 1)
    }
    if !self.errorMessage.isEmpty {
      try visitor.visitSingularStringField(value: self.errorMessage, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: SendResponse, rhs: SendResponse) -> Bool {
    if lhs.errorCode != rhs.errorCode {return false}
    if lhs.errorMessage != rhs.errorMessage {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ChainSpec: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChainSpec"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ChainSpec, rhs: ChainSpec) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
