import SwiftUI
import MapKit

struct HallMapView: View {
    @State private var showCampusMap = false
    let room: Room
    let floor: Floor
    let building: Building
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Lecture Hall Section
                VStack(alignment: .leading, spacing: 12) {
                    Text(room.name)
                        .font(Font.custom("Lexend-Medium", size: 32))
                        .fontWeight(.bold)
                    
                    Text("Room \(room.number)")
                        .font(Font.custom("Quicksand-Medium", size: 18))
                        .foregroundColor(.gray)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Floor Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Floor \(floor.number)")
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    // Floor Plan Placeholder
                    ZStack {
                        Rectangle()
                            .fill(Color(.systemBackground))
                            .frame(height: 200)
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        
                        Text("Floor Plan")
                            .foregroundColor(.gray)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Building Section
                VStack(alignment: .leading, spacing: 12) {
                    Text(building.name)
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    Button(action: {
                        showCampusMap = true
                    }) {
                        HStack {
                            Image(systemName: "map")
                            Text("Get Directions")
                                .font(Font.custom("Quicksand-Medium", size: 16))
                        }
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Location")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCampusMap) {
            NavigationStack {
                Map(initialPosition: .region(MKCoordinateRegion(
                    center: building.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                ))) {
                    Annotation(building.name, coordinate: building.coordinate) {
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
                    }
                }
                .navigationTitle("Campus Map")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            showCampusMap = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HallMapView(
            room: Room(number: "101", name: "Lecture Hall 1", type: .classroom),
            floor: Floor(number: 1, rooms: []),
            building: Building(
                name: "Main Building",
                floors: [],
                coordinate: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729)
            )
        )
    }
}
