import SwiftUI
struct SpaceSelectionView: View {
    @Binding var selectedCategory: String
    var onCardTap: () -> Void
    
    let spaces: [(title: String, icon: String)] = [
        ("Library", "book.fill"),
        ("Study Room", "person.fill"),
        ("Computer Room", "desktopcomputer")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(spaces, id: \.title) { space in
                    SpaceCard(
                        title: space.title,
                        icon: space.icon,
                        isSelected: selectedCategory == space.title
                    ) {
                        selectedCategory = space.title
                        onCardTap()
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
