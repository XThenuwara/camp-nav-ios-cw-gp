//
//  MapView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-22.
//
import SwiftUI
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

struct MapView: View {
    @State private var selectedBuilding: Building?
    @State private var selectedFloor: Floor?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    let buildings = [
        Building(
            name: "Main Building",
            floors: [
                Floor(number: 1, rooms: [
                    Room(number: "101", name: "Lecture Hall 1", type: .classroom),
                    Room(number: "102", name: "Computer Lab", type: .laboratory)
                ]),
                Floor(number: 2, rooms: [
                    Room(number: "201", name: "Lecture Hall 2", type: .classroom),
                    Room(number: "202", name: "Faculty Office", type: .office)
                ])
            ],
            coordinate: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729)
        ),
        Building(
            name: "Science Complex",
            floors: [
                Floor(number: 1, rooms: [
                    Room(number: "S101", name: "Physics Lab", type: .laboratory),
                    Room(number: "S102", name: "Chemistry Lab", type: .laboratory)
                ])
            ],
            coordinate: CLLocationCoordinate2D(latitude: 6.9157, longitude: 79.9739)
        )
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Campus Map
                Map(coordinateRegion: $region, annotationItems: buildings) { building in
                    MapAnnotation(coordinate: building.coordinate) {
                        VStack(spacing: 4) {
                            Image(systemName: "building.2.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 24))
                            
                            Text(building.name)
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(4)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(4)
                        }
                        .onTapGesture {
                            selectedBuilding = building
                        }
                    }
                }
                .cornerRadius(20)
                .padding(.all)
                .frame(height: 350)
                
                // Buildings List
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(buildings) { building in
                            Button(action: {
                                selectedBuilding = building
                            }) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(building.name)
                                        .font(Font.custom("Lexend-Medium", size: 20))
                                        .fontWeight(.semibold)
                                    
                                    Text("\(building.floors.count) Floors")
                                        .font(Font.custom("Quicksand-Medium", size: 16))
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.backgroundGray)
                                .cornerRadius(12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Campus Map")
            .navigationDestination(item: $selectedBuilding) { building in
                BuildingDetailView(building: building, selectedFloor: $selectedFloor)
            }
            .navigationDestination(item: $selectedFloor) { floor in
                FloorPlanView(floor: floor)
            }
        }
    }
}

struct BuildingDetailView: View {
    let building: Building
    @Binding var selectedFloor: Floor?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(building.floors) { floor in
                    Button(action: {
                        selectedFloor = floor
                    }) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Floor \(floor.number)")
                                    .font(Font.custom("Lexend-Medium", size: 20))
                                    .fontWeight(.semibold)
                                
                                Text("\(floor.rooms.count) Rooms")
                                    .font(Font.custom("Quicksand-Medium", size: 16))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle(building.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FloorPlanView: View {
    let floor: Floor
    
    var body: some View {
        VStack(spacing: 0) {
            // Title and Room Name
            Text(floor.rooms.first?.name ?? "")
                .font(Font.custom("Lexend-Medium", size: 24))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Map Area
            ZStack {
                Rectangle()
                    .fill(Color(.systemBackground))
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .cornerRadius(12)
                    .shadow(radius: 2)
                    .padding()
                    
                Text("Floor Plan")
                    .font(Font.custom("Lexend-Medium", size: 18))
                    .foregroundColor(.gray)
            }
            
            // Room List
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(floor.rooms) { room in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(room.name)
                                .font(Font.custom("Lexend-Medium", size: 20))
                                .fontWeight(.semibold)
                            
                            HStack {
                                Image(systemName: "door.left.hand.closed")
                                Text("Room \(room.number)")
                                    .font(Font.custom("Quicksand-Medium", size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Floor \(floor.number)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapView()
}

