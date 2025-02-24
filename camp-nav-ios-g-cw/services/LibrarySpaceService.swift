import Foundation
import FirebaseFirestore

class LibrarySpaceService {
    private let db = Firestore.firestore()
    private let collectionName = "librarySpaces" // Firestore collection name
    
    // MARK: - Create Library Space Booking
    func createLibrarySpace(space: LibrarySpace, completion: @escaping (Result<String, Error>) -> Void) {
        let data = space.toDictionary()
        
        db.collection(collectionName).addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Library space booking created successfully!"))
            }
        }
    }
    
    // MARK: - Update Library Space Booking
    func updateLibrarySpace(space: LibrarySpace, completion: @escaping (Result<String, Error>) -> Void) {
        guard let spaceId = space.id else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Library space ID is missing"])))
            return
        }
        
        let data = space.toDictionary()
        
        db.collection(collectionName).document(spaceId).setData(data, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Library space booking updated successfully!"))
            }
        }
    }
    
    // MARK: - Delete Library Space Booking
    func deleteLibrarySpace(spaceId: String, completion: @escaping (Result<String, Error>) -> Void) {
        db.collection(collectionName).document(spaceId).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Library space booking deleted successfully!"))
            }
        }
    }
    
    // MARK: - Get All Library Space Bookings
    func getAllLibrarySpaces(completion: @escaping (Result<[LibrarySpace], Error>) -> Void) {
        db.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let spaces = documents.compactMap { document -> LibrarySpace? in
                return LibrarySpace(id: document.documentID, dictionary: document.data())
            }
            
            completion(.success(spaces))
        }
    }
    
    // MARK: - Get Library Spaces by User ID
    func getLibrarySpacesByUserId(userId: String, completion: @escaping (Result<[LibrarySpace], Error>) -> Void) {
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
                
                let spaces = documents.compactMap { document -> LibrarySpace? in
                    return LibrarySpace(id: document.documentID, dictionary: document.data())
                }
                
                completion(.success(spaces))
            }
    }
    
    // MARK: - Check Availability of a Library Space
    func isSpaceAvailable(role: String, seatNumber: Int, date: Date, startTime: Date, endTime: Date, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Create start and end of the selected date to query
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        guard let startOfDay = calendar.date(from: dateComponents),
              let endOfDay = calendar.date(byAdding: DateComponents(day: 1), to: startOfDay) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid date"])))
            return
        }
        
        db.collection(collectionName)
            .whereField("role", isEqualTo: role)
            .whereField("seatNumber", isEqualTo: seatNumber)
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error)
                    completion(.failure(error))
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    completion(.success(true)) // No bookings found, space is available
                    return
                }
                
                // Check for overlapping bookings
                let hasOverlap = documents.contains { document in
                    let data = document.data()
                    guard let existingStartTime = data["startTime"] as? Timestamp,
                          let existingEndTime = data["endTime"] as? Timestamp else {
                        return false
                    }
                    
                    let existingStart = existingStartTime.dateValue()
                    let existingEnd = existingEndTime.dateValue()
                    
                    // Time ranges overlap if one range's start is before the other's end
                    // and the first range's end is after the other's start
                    let hasOverlap = (startTime < existingEnd && endTime > existingStart)
                    return hasOverlap
                }
                
                completion(.success(!hasOverlap))
            }
    }
}
