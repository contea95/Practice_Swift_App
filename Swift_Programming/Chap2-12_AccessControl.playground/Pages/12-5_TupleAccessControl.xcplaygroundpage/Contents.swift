internal class InternalClass {}
private struct PrivateStruct {}

// public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())
private var privateTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())
