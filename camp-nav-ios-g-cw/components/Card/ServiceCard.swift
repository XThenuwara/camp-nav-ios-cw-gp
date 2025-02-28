//
//  ServiceCard.swift
//  camp-nav-ios-g-cw
//
//  Created by Gevindu Piyumal on 2025-02-28.
//

import SwiftUI

struct ServiceCard: View {

    let service: EssentialService
    var body: some View {
        NavigationLink(
            destination: ServiceDetailView(service: service)
        ) {
            VStack(alignment: .leading, spacing: 4) {
                Text(service.name)
                    .font(Font.custom("Lexend-Medium", size: 16))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(service.overview)
                    .font(Font.custom("Quicksand-Medium", size: 16))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.white))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview{
    ServiceCard(service: sampleServices[0])
}
