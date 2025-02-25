import SwiftUI

struct DiningView: View {
     private var productService = ProductService()
    @State private var diningProducts: [ProductModel] = []
    @State private var navigationPath = NavigationPath()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
         
            Text("Dining")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            
            if diningProducts.isEmpty {
                ProgressView("Loading...")
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
                    diningProducts = fetchedProducts 
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
