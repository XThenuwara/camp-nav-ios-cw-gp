import SwiftUI

struct EssentialServicesView: View {
    let services: [EssentialService] = sampleServices
    @State private var searchText: String = ""

    var filteredServices: [EssentialService] {
        if searchText.isEmpty {
            return services
        } else {
            return services.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 12) {
                // Header
                Text("Essential Service Information")
                    .font(Font.custom("Lexend-Medium", size: 26))
                    .fontWeight(.bold)

                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search services...", text: $searchText)
                }
                .padding(.all, 16)
                .background(Color.white)
                .cornerRadius(50)

                // Service List
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(filteredServices) { service in
                            ServiceCard(service: service)
                        }
                    }
                }
            }
            .padding()
            .background(.backgroundGray)
        }
    }
}

struct EssentialServicesView_Previews: PreviewProvider {
    static var previews: some View {
        EssentialServicesView()
    }
}
