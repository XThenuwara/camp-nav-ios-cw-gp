import SwiftUI

struct AllSpacesView: View {
    @State private var selectedCategory: String = "Library"
    @State private var navigateToBooking: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Space Bookings")
                    .font(.title)
                    .bold()
                    .padding()
                
                SpaceSelectionView(
                    selectedCategory: $selectedCategory,
                    onCardTap: {
                        navigateToBooking = true
                    }
                )
                .padding()
                
                Text("Recent")
                    .font(.title)
                    .padding()
                
                SpaceBookingContainer(type: selectedCategory)
                Spacer()
            }
            .navigationDestination(isPresented: $navigateToBooking) {
                switch selectedCategory {
                case "Library":
                    LibrarySpaceBookView()
                case "Study Room":
                    StudyRoomBookView() // Replace with StudyRoomBookView when available
                case "Computer Room":
                    ComputerRoomBookView() // Replace with ComputerRoomBookView when available
                default:
                    LibrarySpaceBookView()
                }
            }
        }
    }
}
