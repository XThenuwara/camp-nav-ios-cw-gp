//
//  InfoCard.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-16.
//
import SwiftUI
struct InfoCard: View {
    var title: String
    var lastUpdated: String
    var value: String

    var body: some View {
        VStack(alignment:.leading, spacing: 16) {
            Text(title)
                .font(Font.custom("Lexend-Medium", size: 18))
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 0)
             
            Text(lastUpdated)
                .font(Font.custom("Quicksand-Medium", size: 10))
                .foregroundStyle(.secondary)
               .fontWeight(.bold)

            Spacer()
            // value should right aligned
            Text(value)
               .font(Font.custom("Quicksand-Medium", size: 16))
               .fontWeight(.bold)
               .frame(maxWidth:.infinity, alignment:.trailing)
               
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .frame(width: 180, height: 180)
        // shadow
       .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    InfoCard(title: "Cafeteria Crowd Level", lastUpdated: "Last Updated: 1 min ago", value: "LOW")
}
