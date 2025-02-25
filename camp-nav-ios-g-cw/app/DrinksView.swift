import SwiftUI

struct DrinksView: View {
     private var productService = ProductService()
    @State private var drinksProducts: [ProductModel] = []
    @State private var navigationPath = NavigationPath()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
           
            Text("Drinks")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
         
            if drinksProducts.isEmpty {
                ProgressView("Loading...")
                    .padding()
            } else {
                ProductContainer(products: drinksProducts,navigationPath: $navigationPath) 
            }
            
            Spacer()
        }
        .onAppear {
    
            productService.getAllProductsByCategory(category: "drinks") { result in
                switch result {
                case .success(let fetchedProducts):
                    drinksProducts = fetchedProducts 
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
