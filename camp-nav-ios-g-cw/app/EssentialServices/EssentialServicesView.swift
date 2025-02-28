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
                            NavigationLink(
                                destination: ServiceDetailView(service: service)
                            ) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(service.name)
                                        .font(
                                            Font.custom(
                                                "Lexend-Medium", size: 16)
                                        )
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(service.overview)
                                        .font(
                                            Font.custom(
                                                "Quicksand-Medium", size: 16)
                                        )
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(.white))
                                .cornerRadius(12)
                                .shadow(
                                    color: .black.opacity(0.1), radius: 5, x: 0,
                                    y: 2)
                            }
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
