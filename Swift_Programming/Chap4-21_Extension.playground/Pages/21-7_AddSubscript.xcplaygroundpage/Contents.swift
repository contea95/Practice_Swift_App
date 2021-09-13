extension String {
    subscript(appedValue: String) -> String {
        return self + appedValue
    }
    
    subscript(repeatCount: UInt) -> String {
        var str: String = ""
        
        for _ in 0..<repeatCount {
            str += self
        }
        
        return str
    }
}

print("abc"["def"])
print("abc"[3])
