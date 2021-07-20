public struct SomeType {
    // 비공개 저장 프로퍼티
    private var count: Int = 0
    
    // 공개 저장 프로퍼티
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 프로퍼티, 설정자만 비공개
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    // 내부 저장 프로퍼티
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    // 공개 서브스크립트
    public subscript() -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    // 공개 서브 스크립트, 설정자는 내부접근
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

// 외부에서 접근자, 설정자 사용 가능
print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 100

print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100
print(someInstance.internalComputedProperty)

print(someInstance.internalGetOnlyComputedProperty)
//someInstance.internalGetOnlyComputedProperty = 100

print(someInstance[])
someInstance[] = 100

print(someInstance[0])
someInstance[0] = 100
