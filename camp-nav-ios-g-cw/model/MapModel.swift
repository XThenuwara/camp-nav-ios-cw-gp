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
    
    let floorPlanImageName: String?
    
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


let sampleMapData: [Building] = [
    Building(
        name: "Main Building",
        floors: [
            Floor(number: 1, rooms: [
                Room(number: "101", name: "Lecture Hall 1", type: .classroom),
                Room(number: "102", name: "Computer Lab", type: .laboratory)
            ],
                  floorPlanImageName: "Main Building - 1st Floor"
                 ),
            Floor(number: 2, rooms: [
                Room(number: "201", name: "Lecture Hall 2", type: .classroom),
                Room(number: "202", name: "Faculty Office", type: .office)
            ],
                  floorPlanImageName: "Main Building - 1st Floor"
                 )
        ],
        coordinate: CLLocationCoordinate2D(latitude: 6.906526, longitude: 79.870759)
    ),
    Building(
        name: "Technical Building",
        floors: [
            Floor(number: 1, rooms: [
                Room(number: "S101", name: "Computer Lab", type: .laboratory),
                Room(number: "S102", name: "Network Lab", type: .laboratory)
            ],
                  floorPlanImageName: "Main Building - 1st Floor"
                 )
        ],
        coordinate: CLLocationCoordinate2D(latitude: 6.906254, longitude: 79.870920)
    )
]
