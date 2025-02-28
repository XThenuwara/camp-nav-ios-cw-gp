import MapKit
import SwiftUI

struct MapView: View {
    @State private var selectedBuilding: Building?
    @State private var searchText = ""
    @State private var isSearching = false
    

    let buildings = sampleMapData;
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.906254, longitude: 79.870920),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    

    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            // Campus Map
            Map(position: $position) {
                ForEach(buildings) { building in
                    Annotation(
                        building.name, coordinate: building.coordinate
                    ) {
                        Button(action: {
                            selectedBuilding = building
                        }) {
                            VStack(spacing: 4) {
                                Image(systemName: "building.2.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 24))
                            }
                        }
                    }
                }
            }
            .cornerRadius(10)
            .padding(.all, 8)
            .mapStyle(.standard)
            .frame(height: 400)
            .background(Color.white)
            .cornerRadius(15)
            
            // Buildings List
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(buildings) { building in
                        Button(action: {
                            selectedBuilding = building
                        }) {
                            MapViewCard(building: building)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .padding(.horizontal)
        .background(Color(.backgroundGray))
        .navigationTitle("Campus Map")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(Color(.backgroundGray), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationDestination(item: $selectedBuilding) { building in
            BuildingDetailView(building: building)
        }
    }
}

#Preview {
    MapView()
}
