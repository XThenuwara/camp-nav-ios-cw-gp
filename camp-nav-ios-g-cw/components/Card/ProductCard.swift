import SwiftUI
import SDWebImageSwiftUI

struct ProductCard: View {
    let product: ProductModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image
            WebImage(url: URL(string: product.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 150)
                .clipped()
                .cornerRadius(10)
            
            // Price
            Text(String(format: "$%.2f", product.price))
                .font(.headline)
                .foregroundColor(.blue)
            
            // Name
            Text(product.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
            
            // Availability
            HStack {
                Text(product.availability ? "Available" : "Unavailable")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(product.availability ? Color.green : Color.gray)
                    .cornerRadius(10)
            }
        }
        .frame(width: 140) // Set constant width for the entire card
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(radius: 1)
    }
}
