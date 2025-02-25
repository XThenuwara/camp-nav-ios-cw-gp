import SwiftUI
import SDWebImageSwiftUI

struct ProductContainer: View {
    let products: [ProductModel]
    @Binding var navigationPath: NavigationPath

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(products, id: \.id) { product in
                    ProductCard(product: product, navigationPath: $navigationPath)
                }
            }
            .padding()
        }
    }
}
