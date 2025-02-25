import SwiftUI

struct ShortiesView: View {
    private var productService = ProductService() // Initialize the service
    @State private var shortiesProducts: [ProductModel] = [] // State to hold fetched fast food products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title at the top left corner
            Text("Shorties")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // Fetch and display fast food products
            if shortiesProducts.isEmpty {
                ProgressView("Loading...") // Show a loading indicator while fetching data
                    .padding()
            } else {
                ProductContainer(products: shortiesProducts) // Display products in a grid
            }
            
            Spacer()
        }
        .onAppear {
            // Fetch fast food products when the view appears
            productService.getAllProductsByCategory(category: "shorties") { result in
                switch result {
                case .success(let fetchedProducts):
                    shortiesProducts = fetchedProducts // Update the state with fetched products
                case .failure(let error):
                    print("Error fetching fast food products: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ShortiesView()
}
