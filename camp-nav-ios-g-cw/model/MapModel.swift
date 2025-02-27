import Foundation
import MapKit

struct Building: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let floors: [Floor]
    let coordinate: CLLocationCoordinate2D

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Building, rhs: Building) -> Bool {
        lhs.id == rhs.id
    }
}

struct Floor: Identifiable, Hashable {
    let id = UUID()
    let number: Int
    let rooms: [Room]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Floor, rhs: Floor) -> Bool {
        lhs.id == rhs.id
    }
}

struct Room: Identifiable {
    let id = UUID()
    let number: String
    let name: String
    let type: RoomType
}

enum RoomType {
    case classroom
    case laboratory
    case office
    case other
}
