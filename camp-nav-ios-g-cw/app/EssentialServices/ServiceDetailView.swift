import SwiftUI

struct ServiceDetailView: View {
    let service: EssentialService

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                VStack(spacing: 5) {
                    Text(service.name)
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text(service.overview)
                        .font(Font.custom("Quicksand-Medium", size: 16))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.white))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)


                if service.services != [] {
                    VStack(spacing: 5) {
                        Text("Services Provided")
                            .font(Font.custom("Lexend-Medium", size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ForEach(service.services, id: \.self) { service in
                            Text("• \(service)")
                                .font(Font.custom("Quicksand-Medium", size: 16))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }

                if !service.location.isEmpty {
                    VStack(spacing: 5) {
                        Text("Location")
                            .font(Font.custom("Lexend-Medium", size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("• \(service.location)")
                            .font(Font.custom("Quicksand-Medium", size: 16))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                    
                }

                if !service.hours.isEmpty {
                    VStack(spacing: 5) {
                        Text("Operating Hours")
                            .font(Font.custom("Lexend-Medium", size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("• \(service.hours)")
                            .font(Font.custom("Quicksand-Medium", size: 16))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }

                if !service.phone.isEmpty {
                    VStack(spacing: 5) {
                        Text("Phone")
                            .font(Font.custom("Lexend-Medium", size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(service.phone, id: \.self) { phone in
                            Text("• \(phone)")
                                .font(Font.custom("Quicksand-Medium", size: 16))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }

                if !service.email.isEmpty {
                    VStack(spacing: 5) {
                        Text("Email")
                            .font(Font.custom("Lexend-Medium", size: 20))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(service.email, id: \.self) { email in
                            Text("• \(email)")
                                .font(Font.custom("Quicksand-Medium", size: 16))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
            }
            .padding()
        }
        .background(.backgroundGray)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(service: sampleServices[0])
    }
}
