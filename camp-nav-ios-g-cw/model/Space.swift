import Foundation
import FirebaseCore

struct Space {
    var id: String? // Document ID from Firestore
    var userId: String // ID of the user who booked the space
    var role: String
    var date: Date // Date of the booking
    var startTime: Date // Start time of the booking
    var endTime: Date // End time of the booking
    var seatNumber: Int // Seat number in the library
    var type: String
    
    // Convert model to a dictionary for Firestore
    func toDictionary() -> [String: Any] {
        return [
            "userId": userId,
            "role": role,
            "date": date,
            "startTime": startTime,
            "endTime": endTime,
            "seatNumber": seatNumber,
            "type" : type
        ]
    }
    
    // Initialize from Firestore document
    init?(id: String, dictionary: [String: Any]) {
            guard let userId = dictionary["userId"] as? String,
                  let role = dictionary["role"] as? String,
                  let type = dictionary["type"] as? String else {
                return nil
            }
            
            // Handle Firestore Timestamps
            if let dateTimestamp = dictionary["date"] as? Timestamp,
               let startTimestamp = dictionary["startTime"] as? Timestamp,
               let endTimestamp = dictionary["endTime"] as? Timestamp,
               let seatNumber = dictionary["seatNumber"] as? Int {
                
                self.id = id
                self.userId = userId
                self.role = role
                self.date = dateTimestamp.dateValue()
                self.startTime = startTimestamp.dateValue()
                self.endTime = endTimestamp.dateValue()
                self.seatNumber = seatNumber
                self.type = type
            } else {
                return nil
            }
        }
    // New initializer for direct property assignment
    init(id: String?, userId: String, role: String, date: Date, startTime: Date, endTime: Date, seatNumber: Int,type:String) {
        self.id = id
        self.userId = userId
        self.role = role
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.seatNumber = seatNumber
        self.type = type
    }
}
