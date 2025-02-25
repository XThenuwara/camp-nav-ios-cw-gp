import SwiftUI

struct DrinksView: View {
     private var productService = ProductService() // Initialize the service
    @State private var drinksProducts: [ProductModel] = [] // State to hold fetched drinks products
    @State private var navigationPath = NavigationPath()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title at the top left corner
            Text("Drinks")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // Fetch and display drinks products
            if drinksProducts.isEmpty {
                ProgressView("Loading...") // Show a loading indicator while fetching data
                    .padding()
            } else {
                ProductContainer(products: drinksProducts,navigationPath: $navigationPath) 
            }
            
            Spacer()
        }
        .onAppear {
            // Fetch drinks products when the view appears
            productService.getAllProductsByCategory(category: "drinks") { result in
                switch result {
                case .success(let fetchedProducts):
                    drinksProducts = fetchedProducts // Update the state with fetched products
                case .failure(let error):
                    print("Error fetching drinks products: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    DrinksView()
}
