import SwiftUI

struct DiningView: View {
     private var productService = ProductService() // Initialize the service
    @State private var diningProducts: [ProductModel] = [] // State to hold fetched dining products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title at the top left corner
            Text("Dining")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // Fetch and display dining products
            if diningProducts.isEmpty {
                ProgressView("Loading...") // Show a loading indicator while fetching data
                    .padding()
            } else {
                ProductContainer(products: diningProducts) // Display products in a grid
            }
            
            Spacer()
        }
        .onAppear {
            // Fetch dining products when the view appears
            productService.getAllProductsByCategory(category: "dining") { result in
                switch result {
                case .success(let fetchedProducts):
                    diningProducts = fetchedProducts // Update the state with fetched products
                case .failure(let error):
                    print("Error fetching dining products: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    DiningView()
}
