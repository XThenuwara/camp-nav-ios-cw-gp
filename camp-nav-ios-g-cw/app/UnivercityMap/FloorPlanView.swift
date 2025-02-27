import SwiftUI

struct FloorPlanView: View {
    let floor: Floor

    var body: some View {
        VStack(spacing: 0) {
            Text("Floor \(floor.number)")
                .font(Font.custom("Lexend-Medium", size: 24))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

            ZStack {
                if let imageName = floor.floorPlanImageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .padding()
                } else {
                    Rectangle()
                        .fill(Color(.systemBackground))
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .padding()
                        .overlay(
                            Text("Floor Plan")
                                .font(Font.custom("Lexend-Medium", size: 18))
                                .foregroundColor(.gray)
                        )
                }
            }

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
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FloorPlanView_Previews: PreviewProvider {
    static var previews: some View {
        if let firstFloor = MapData.buildings.first?.floors.first {
            FloorPlanView(floor: firstFloor)
        } else {
            Text("No Floor Data")
        }
    }
}
