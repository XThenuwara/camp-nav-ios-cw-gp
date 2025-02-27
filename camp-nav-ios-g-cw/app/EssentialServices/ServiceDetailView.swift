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
                    .font(.subheadline)
                    .lineSpacing(5)

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
                    Text("Location")
                        .font(.headline)

                    Text("• \(service.location)")
                        .font(.subheadline)
                }
                
                Divider()
            
                if !service.hours.isEmpty {
                    Text("Operating Hours")
                        .font(.headline)
                    Text("• \(service.hours)")
                        .font(.subheadline)
                }
                
                Divider()

                

                if !service.phone.isEmpty {
                    Text("Phone")
                        .font(.headline)
                    ForEach(service.phone, id: \.self){ phone in
                        Text("• \(phone)")
                            .font(.subheadline)
                    }
                }
                
                Divider()

                if !service.email.isEmpty {
                    Text("Email")
                        .font(.headline)
                    ForEach(service.email, id: \.self){ email in
                        Text("• \(email)")
                            .font(.subheadline)
                    }
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
