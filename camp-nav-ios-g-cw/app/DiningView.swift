import SwiftUI

struct DiningView: View {
     private var productService = ProductService() // Initialize the service
    @State private var diningProducts: [ProductModel] = [] // State to hold fetched dining products
    @State private var navigationPath = NavigationPath()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
         
            Text("Dining")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            
            if diningProducts.isEmpty {
                ProgressView("Loading...") // Show a loading indicator while fetching data
                    .padding()
            } else {
                ProductContainer(products: diningProducts,navigationPath: $navigationPath) 
            }
            
            Spacer()
        }
        .onAppear {
    
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
