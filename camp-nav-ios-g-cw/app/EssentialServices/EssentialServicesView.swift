import SwiftUI

struct EssentialServicesView: View {
    let services: [EssentialService] = sampleServices
    @State private var searchText: String = ""
    
    var filteredServices: [EssentialService] {
        if searchText.isEmpty {
            return services
        } else {
            return services.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredServices) { service in
                NavigationLink(destination: ServiceDetailView(service: service)) {
                    Text(service.name)
                        .font(.body)
                }
            }
            .navigationTitle("Essential Service Information")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search services...")
        }
    }
}

struct EssentialServicesView_Previews: PreviewProvider {
    static var previews: some View {
        EssentialServicesView()
    }
}
