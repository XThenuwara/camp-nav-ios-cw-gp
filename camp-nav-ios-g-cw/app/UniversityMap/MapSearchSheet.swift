import SwiftUI

struct MapSearchSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var searchText: String
    @Binding var isOpen: Bool
    let buildings: [Building]
    @State var selectedFloor: Floor?
    let onRoomSelect: (Room, Floor, Building) -> Void

    var filteredRooms: [(Building, Floor, Room)] {
        if searchText.isEmpty {
            return buildings.flatMap { building in
                building.floors.flatMap { floor in
                    floor.rooms.map { room in
                        (building, floor, room)
                    }
                }
            }
        }
        
        var results: [(Building, Floor, Room)] = []
        for building in buildings {
            for floor in building.floors {
                for room in floor.rooms {
                    if room.number.lowercased().contains(searchText.lowercased()) ||
                        room.name.lowercased().contains(searchText.lowercased()) {
                        results.append((building, floor, room))
                    }
                }
            }
        }
        return results
    }
    
    @State private var selectedRoom: (Building, Floor, Room)?
        @State private var showHallMap = false
        
        var body: some View {
            DrawerModal(isOpen: $isOpen) {
                VStack {
                    // Search Field
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Lecture Halls", text: $searchText)
                            .font(Font.custom("Quicksand-Medium", size: 16))
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .padding()
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                    // Results List
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(filteredRooms, id: \.2.id) { building, floor, room in
                                Button(action: {
                                        isOpen = false
                                        onRoomSelect(room, floor, building)
                                }) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(room.name)
                                            .font(Font.custom("Lexend-Medium", size: 16))
                                        Text("\(building.name) - Floor \(floor.number), Room \(room.number)")
                                            .font(Font.custom("Quicksand-Medium", size: 14))
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
                .background(Color(.backgroundGray))
            }
            .navigationDestination(isPresented: $showHallMap) {
                if let (building, floor, room) = selectedRoom {
                    HallMapView(room: room, floor: floor, building: building)
                }
            }
        }
}

#Preview {
    MapSearchSheet(
        searchText: .constant(""),
        isOpen: .constant(true),
        buildings: sampleMapData,
        onRoomSelect: { _, _, _ in }
    )
}
