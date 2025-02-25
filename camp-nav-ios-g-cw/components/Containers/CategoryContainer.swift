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
    let onCategorySelected: (FoodCategory) -> Void
    
    var body: some View {
        HStack {
            ForEach(FoodCategory.allCases, id: \.self) { category in
                VStack {
                    Image(systemName: category.iconName)
                        .font(.system(size: 24))
                        .foregroundColor(selectedCategory == category ? .white : .gray)
                        .frame(width: 60, height: 60)
                        .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    
                    Text(category.rawValue)
                        .font(.caption)
                        .foregroundColor(selectedCategory == category ? .blue : .gray)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedCategory = category
                        onCategorySelected(category)
                    }
                }
                
                if category != FoodCategory.allCases.last {
                    Spacer()
                }
            }
        }
        .padding()
    }
}
