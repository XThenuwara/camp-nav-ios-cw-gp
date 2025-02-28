import Foundation
import MapKit

struct MapData {
    static let buildings: [Building] = [
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
            coordinate: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729)
        ),
        Building(
            name: "Science Complex",
            floors: [
                Floor(number: 1, rooms: [
                    Room(number: "S101", name: "Physics Lab", type: .laboratory),
                    Room(number: "S102", name: "Chemistry Lab", type: .laboratory)
                ],
                      floorPlanImageName: "Main Building - 1st Floor"
                )
            ],
            coordinate: CLLocationCoordinate2D(latitude: 6.9157, longitude: 79.9739)
        )
    ]
}
