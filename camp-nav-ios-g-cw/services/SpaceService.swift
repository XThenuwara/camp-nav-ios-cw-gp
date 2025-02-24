import Foundation
import FirebaseFirestore

class SpaceService {
    private let db = Firestore.firestore()
    private let collectionName = "librarySpaces" 
    
    // MARK: - Create Space Booking
    func createSpace(space: Space, completion: @escaping (Result<String, Error>) -> Void) {
        let data = space.toDictionary()
        
        db.collection(collectionName).addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Space booking created successfully!"))
            }
        }
    }
    
    // MARK: - Update Space Booking
    func updateSpace(space: Space, completion: @escaping (Result<String, Error>) -> Void) {
        guard let spaceId = space.id else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Space ID is missing"])))
            return
        }
        
        let data = space.toDictionary()
        
        db.collection(collectionName).document(spaceId).setData(data, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Space booking updated successfully!"))
            }
        }
    }
    
    // MARK: - Delete Space Booking
    func deleteSpace(spaceId: String, completion: @escaping (Result<String, Error>) -> Void) {
        db.collection(collectionName).document(spaceId).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Space booking deleted successfully!"))
            }
        }
    }
    
    // MARK: - Get All Space Bookings
    func getAllSpaces(completion: @escaping (Result<[Space], Error>) -> Void) {
        db.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let spaces = documents.compactMap { document -> Space? in
                return Space(id: document.documentID, dictionary: document.data())
            }
            
            completion(.success(spaces))
        }
    }
    
    // MARK: - Get Spaces by User ID
    func getSpacesByUserId(userId: String, completion: @escaping (Result<[Space], Error>) -> Void) {
        db.collection(collectionName)
            .whereField("userId", isEqualTo: userId)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    completion(.success([]))
                    return
                }
                
                let spaces = documents.compactMap { document -> Space? in
                    return Space(id: document.documentID, dictionary: document.data())
                }
                
                completion(.success(spaces))
            }
    }
    
    // MARK: - Check Availability of a Space
    func isSpaceAvailable(
        role: String, seatNumber: Int, date: Date, startTime: Date, endTime: Date,type:String ,completion: @escaping (Result<Bool, Error>) -> Void) {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        guard let startOfDay = calendar.date(from: dateComponents),
              let endOfDay = calendar.date(byAdding: DateComponents(day: 1), to: startOfDay) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid date"])))
            return
        }
        
        db.collection(collectionName)
            .whereField("role", isEqualTo: role)
            .whereField("type", isEqualTo: type)
            .whereField("seatNumber", isEqualTo: seatNumber)
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    completion(.success(true)) // No bookings found, space is available
                    return
                }
                
                let hasOverlap = documents.contains { document in
                    let data = document.data()
                    guard let existingStartTime = data["startTime"] as? Timestamp,
                          let existingEndTime = data["endTime"] as? Timestamp else {
                        return false
                    }
                    
                    let existingStart = existingStartTime.dateValue()
                    let existingEnd = existingEndTime.dateValue()
                    
                    return (startTime < existingEnd && endTime > existingStart)
                }
                
                completion(.success(!hasOverlap))
            }
    }
    
    // MARK: - Get Bookings by Type
        func getSpacesByType(type: String, completion: @escaping (Result<[Space], Error>) -> Void) {
            db.collection(collectionName)
                .whereField("type", isEqualTo: type)
                .getDocuments { snapshot, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    guard let documents = snapshot?.documents else {
                        completion(.success([]))
                        return
                    }
                    
                    let spaces = documents.compactMap { document -> Space? in
                        return Space(id: document.documentID, dictionary: document.data())
                    }
                    
                    completion(.success(spaces))
                }
        }
}

