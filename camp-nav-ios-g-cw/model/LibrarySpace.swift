import Foundation

struct LibrarySpace {
    var id: String? // Document ID from Firestore
    var userId: String // ID of the user who booked the space
    var role: String
    var date: Date // Date of the booking
    var startTime: Date // Start time of the booking
    var endTime: Date // End time of the booking
    var seatNumber: Int // Seat number in the library
    
    // Convert model to a dictionary for Firestore
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
    
    // Initialize from Firestore document
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
    
    // New initializer for direct property assignment
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
