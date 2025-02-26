import SwiftUI

struct CategoryContainer: View {
    enum FoodCategory: String, CaseIterable {
        case dining = "Dining"
        case fastFood = "Fast Food"
        case drinks = "Drinks"
        
        var iconName: String {
            switch self {
            case .dining:
                return "fork.knife"
            case .fastFood:
                return "takeoutbag.and.cup.and.straw"
            case .drinks:
                return "cup.and.saucer"
            }
        }
    }
    
    @State private var selectedCategory: FoodCategory?
    @State private var showingDrawer = false
    let onCategorySelected: (FoodCategory) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Categories")
                .font(Font.custom("Lexend-Medium", size: 20))
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(FoodCategory.allCases, id: \.self) { category in
                        VStack(spacing: 12) {
                            Image(systemName: category.iconName)
                                .font(.system(size: 24))
                                .foregroundColor(selectedCategory == category ? .white : .gray)
                                .frame(width: 60, height: 60)
                                .background(
                                    selectedCategory == category ? 
                                        Color.black.opacity(0.8) : 
                                        Color.white
                                )
                                .cornerRadius(8)
                                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                            
                            Text(category.rawValue)
                                .font(Font.custom("Lexend-Medium", size: 14))
                                .foregroundColor(selectedCategory == category ? .black : .gray)
                        }
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedCategory = category
                                showingDrawer = true
                                onCategorySelected(category)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(Color.backgroundGray)
        .cornerRadius(16)
        .sheet(isPresented: $showingDrawer) {
            DrawerModal(isOpen: $showingDrawer) {
                if let category = selectedCategory {
                    Group {
                        switch category {
                        case .dining:
                            DiningView()
                        case .fastFood:
                            ShortiesView()
                        case .drinks:
                            DrinksView()
                        }
                    }
                }
            }
        }
    }
}
