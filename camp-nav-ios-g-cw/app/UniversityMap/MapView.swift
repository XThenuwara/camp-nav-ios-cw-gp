import MapKit
import SwiftUI

struct MapView: View {
    @State private var selectedBuilding: Building?
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 6.9147, longitude: 79.9729),
//        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//    )
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.9147, longitude: 79.9729),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))

    var body: some View {
        VStack(spacing: 20) {
            // Campus Map
            Map(position: $position) {
                ForEach(Building) { building in
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

                                Text(building.name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
            .mapStyle(.standard)
            .frame(height: 400)
            .cornerRadius(15)
            .padding(.all, 10)

            // Buildings List
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(MapData.buildings) { building in
                        Button(action: {
                            selectedBuilding = building
                        }) {
                            MapViewCard(building: building)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }
                }
            }
            .navigationDestination(item: $selectedBuilding) { building in
                BuildingDetailView(building: building)
            }
        }
        .background(Color(.backgroundGray))
    }
}

#Preview {
    MapView()
}
