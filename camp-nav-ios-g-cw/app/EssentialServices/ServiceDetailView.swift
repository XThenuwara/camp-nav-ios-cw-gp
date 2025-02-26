import SwiftUI

struct ServiceDetailView: View {
    let service: EssentialService

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(service.name)
                    .font(.title)
                    .bold()

                Text(service.overview)
                    .font(.body)

                Divider()

                if service.services != [] {
                    Text("Services Provided")
                        .font(.headline)
                    ForEach(service.services, id: \.self) { service in
                        Text("• \(service)")
                            .font(.subheadline)
                    }
                }

                Divider()

                if !service.location.isEmpty {
                    Text("Location: \(service.location)")
                        .font(.subheadline)
                }

                if !service.hours.isEmpty {
                    Text("Hours: \(service.hours)")
                        .font(.subheadline)
                }
                
                if !service.phone.isEmpty {
                    Text("Phone: \(service.phone[0])")
                        .font(.subheadline)
                }
                
                if !service.email.isEmpty {
                    Text("Email: \(service.email[0])")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(service.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(service: sampleServices[0])
    }
}
