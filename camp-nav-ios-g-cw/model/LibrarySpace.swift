import Foundation

struct LibrarySpace {
    var id: String?
    var userId: String
    var role: String
    var date: Date
    var startTime: Date
    var endTime: Date
    var seatNumber: Int
    

    func toDictionary() -> [String: Any] {
        return [
            "userId": userId,
            "role": role,
            "date": date,
            "startTime": startTime,
            "endTime": endTime,
            "seatNumber": seatNumber
        ]
    }
    

    init?(id: String, dictionary: [String: Any]) {
        guard let userId = dictionary["userId"] as? String,
              let role = dictionary["role"] as? String,
              let date = dictionary["date"] as? Date,
              let startTime = dictionary["startTime"] as? Date,
              let endTime = dictionary["endTime"] as? Date,
              let seatNumber = dictionary["seatNumber"] as? Int else {
            return nil
        }
        
        self.id = id
        self.userId = userId
        self.role = role
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.seatNumber = seatNumber
    }
    
   
    init(id: String?, userId: String, role: String, date: Date, startTime: Date, endTime: Date, seatNumber: Int) {
        self.id = id
        self.userId = userId
        self.role = role
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.seatNumber = seatNumber
    }
}
