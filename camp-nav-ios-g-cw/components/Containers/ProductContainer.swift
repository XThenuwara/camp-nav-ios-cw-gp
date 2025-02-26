import SwiftUI
import SDWebImageSwiftUI // For loading images from URLs

struct ProductContainer: View {
    // List of products passed through constructor
    let products: [ProductModel]
    
    // Define the grid layout (2 columns)
    let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(products, id: \.id) { product in
                    ProductCard(product: product)
                }
                .padding(.horizontal, 8)
            }
        }
        .padding(.horizontal, 8)
    }
}
