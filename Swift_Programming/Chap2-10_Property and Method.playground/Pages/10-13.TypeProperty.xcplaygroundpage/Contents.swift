class Account {
    static let dollorExchangeRate: Double = 1000.0
    
    var credit: Int = 0
    
    var dollorValue: Double {
        get {
            return Double(credit) / Self.dollorExchangeRate
        }
        
        set {
            credit = Int(newValue * Self.dollorExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중 입니다.")
        }
    }
}

var myAccount: Account = Account()
myAccount.credit = 1000
print(myAccount.dollorValue)
myAccount.dollorValue = 1200
print(myAccount.dollorValue)
print(myAccount.credit)
