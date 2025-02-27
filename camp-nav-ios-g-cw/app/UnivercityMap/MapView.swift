import SwiftUI
import MapKit

struct MapView: View {
    @State private var selectedBuilding: Building?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Campus Map
                Map(coordinateRegion: $region, annotationItems: MapData.buildings) { building in
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
                        ForEach(MapData.buildings) { building in
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
                // Push BuildingDetailView which will handle floor selection.
                BuildingDetailView(building: building)
            }
        }
    }
}

#Preview {
    MapView()
}
