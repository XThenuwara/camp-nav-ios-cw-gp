import SwiftUI

struct FoodItemView: View {
    let product: ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(height: 200)
            .cornerRadius(10)
            
            Text(product.category)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 5)
            
            Text("LKR \(String(format: "%.2f", product.price))")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(product.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 2)
            
            Button(action: {}) {
                Text(product.availability ? "Available" : "Out of Stock")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(product.availability ? Color.gray : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}
