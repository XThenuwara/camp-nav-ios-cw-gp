//
//  MapViewCard.swift
//  camp-nav-ios-g-cw
//
//  Created by Gevindu Piyumal on 2025-02-28.
//

import SwiftUI

struct MapViewCard: View {
    let building: Building
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(building.name)
                .font(
                    Font.custom(
                        "Lexend-Medium", size: 20
                    )
                )
                .fontWeight(.semibold)
            
            Text("\(building.floors.count) Floors")
                .font(
                    Font.custom(
                        "Quicksand-Medium", size: 16
                    )
                )
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white)
        .cornerRadius(12)
        .shadow(
            color: Color.black.opacity(0.1), radius: 5,
            x: 0, y: 2
        )
    }
}

#Preview {
    MapViewCard(building: MapData.buildings[0])
}
