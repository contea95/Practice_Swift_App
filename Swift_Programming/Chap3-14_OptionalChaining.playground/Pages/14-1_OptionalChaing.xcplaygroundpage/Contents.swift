class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String // 광역시/도
    var city: String // 시/군/구
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")

let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number

//var roomNumber: Int? = nil
//
//if let yagomAddress: Address = yagom.address {
//    if let yagomBuilding: Building = yagomAddress.building {
//        if let yagomRoom: Room = yagomBuilding.room {
//            roomNumber = yagomRoom.number
//        }
//    }
//}
//
//if let number: Int = roomNumber {
//    print(number)
//} else {
//    print("Can not find room number")
//}

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}

// 할당은 가능하지만 address가 없으므로 할당은 안됨
yagom.address?.building?.room?.number = 505
print(yagom.address?.building?.room?.number)

yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로")
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

print(yagom.address?.building?.room?.number)

yagom.address?.fullAddress()?.isEmpty
yagom.address?.printAddress()

let optionalArray: [Int]? = [1,2,3]
optionalArray?[1]

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]
