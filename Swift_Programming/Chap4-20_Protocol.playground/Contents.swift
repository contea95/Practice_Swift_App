protocol Receiveable {
    func received(data: Any, from: Sendable)
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendabledInstance: Sendable = instance as? Sendable {
            return sendabledInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Mail ha no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "HI")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "HII")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "IIIII)")

myMail.to = yourMail
myMail.send(data: "HIIIII")

Message.isSendableInstance("Hello")

Message.isSendableInstance(Mail.self)

Message.isSendableInstance(myMail)
