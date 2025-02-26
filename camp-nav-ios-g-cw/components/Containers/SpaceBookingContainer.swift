import SwiftUI
import Dispatch

struct SpaceBookingContainer: View {
    let type: String
    @State private var spaces: [Space] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            if spaces.isEmpty {
                Text("No bookings available")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(spaces, id: \.id) { space in
                            BookingCard(space: space)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .onAppear {
            fetchSpaces()
        }
        .onChange(of: type) { newType in
            fetchSpaces()
        }
    }
    
    private func fetchSpaces() {
        print("Fetching spaces for type: \(type)")
        let spaceService = SpaceService()
        spaceService.getAllSpaces() { result in
            switch result {
            case .success(let fetchedSpaces):
                print("Fetched \(fetchedSpaces.count) spaces") // Debug print
                DispatchQueue.main.async {
                    spaces = fetchedSpaces
                }
            case .failure(let error):
                print("Error fetching spaces: \(error.localizedDescription)")
            }
        }
    }
}

