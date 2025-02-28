import SwiftUI

struct BuildingDetailView: View {
    let building: Building
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(building.floors) { floor in
                    NavigationLink(destination: FloorPlanView(floor: floor, building: building)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Floor \(floor.number)")
                                    .font(Font.custom("Lexend-Medium", size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("\(floor.rooms.count) Rooms")
                                    .font(Font.custom("Quicksand-Medium", size: 16))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    }
                }
            }
            .padding()
        }
        .background(Color(.backgroundGray))
        .navigationTitle(building.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BuildingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingDetailView(building: sampleMapData.first!)
    }
}
