import SwiftUI

struct FloorPlanView: View {
    let floor: Floor
    let building: Building

    var body: some View {
        VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Floor \(floor.number)")
                        .font(Font.custom("Lexend-Medium", size: 24))
                    
                    ZStack {
                        if let imageName = floor.floorPlanImageName {
                            Rectangle()
                                .fill(Color(.systemBackground))
                                .frame(height: 200)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                                .overlay(
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 400)
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                        .padding()
                                )
                        } else {
                            Rectangle()
                                .fill(Color(.systemBackground))
                                .frame(height: 200)
                                .cornerRadius(12)
                                .shadow(radius: 2)
                            
                            Text("Floor Plan")
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(Color(.systemGray6))
                .cornerRadius(12)


            // Room List: Each room is a NavigationLink to HallMapView.
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(floor.rooms) { room in
                        NavigationLink(
                            destination: HallMapView(
                                room: room, floor: floor, building: building)
                        ) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(room.name)
                                    .font(
                                        Font.custom("Lexend-Medium", size: 20)
                                    )
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)

                                HStack {
                                    Image(systemName: "door.left.hand.closed")
                                    Text("Room \(room.number)")
                                        .font(
                                            Font.custom(
                                                "Quicksand-Medium", size: 16)
                                        )
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

struct FloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        if let building = MapData.buildings.first,
            let floor = building.floors.first
        {
            NavigationStack {
                FloorPlanView(floor: floor, building: building)
            }
        } else {
            Text("No Floor Data")
        }
    }
}
