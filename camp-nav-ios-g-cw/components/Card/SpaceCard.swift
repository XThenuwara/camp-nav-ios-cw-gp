import SwiftUI

struct SpaceCard: View {
    var title: String
    var icon: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(isSelected ? .blue : .gray)
            
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? .blue : .black)
        }
        .frame(width: 140, height: 120)
        .background(isSelected ? Color.blue.opacity(0.2) : Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .onTapGesture {
            onTap()
        }
    }
}
