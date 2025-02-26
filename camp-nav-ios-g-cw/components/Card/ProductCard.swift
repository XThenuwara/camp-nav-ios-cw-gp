import SwiftUI
import SDWebImageSwiftUI

struct ProductCard: View {
    let product: ProductModel
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = geometry.size.width
            
            VStack(alignment: .leading) {
                // Image
                WebImage(url: URL(string: product.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardWidth, height: cardWidth)
                    .clipped()
                    .cornerRadius(16)

                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    // Name
                    Text(product.name)
                        .font(Font.custom("Lexend-Medium", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    // Price
                    Text(String(format: "LKR %.2f", product.price))
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                    
                    // Availability
                    Text(product.availability ? "Available" : "Unavailable")
                        .font(Font.custom("Lexend-Medium", size: 12))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            product.availability ? 
                                Color.black.opacity(0.8) : 
                                Color.gray
                        )
                        .cornerRadius(50)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            }
            .frame(width: cardWidth)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .frame(height: 300)
    }
}
