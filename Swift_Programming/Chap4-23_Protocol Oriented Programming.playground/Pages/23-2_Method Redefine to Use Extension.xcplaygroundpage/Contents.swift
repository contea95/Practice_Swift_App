protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    // 메시지를 수신합니다.
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    // 보내는 객체는 자기자신
    var from: Sendable {
        return self
    }
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no reveiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Message: Sendable, Receiveable {
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "hi")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "HI")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "HII")

myMail.to = yourMail
myMail.send(data: "HII")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

Message.isSendableInstance(myPhoneMessage)
Message.isSendableInstance(yourPhoneMessage)
