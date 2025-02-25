import SwiftUI

struct ShortiesView: View {
    private var productService = ProductService()
    @State private var shortiesProducts: [ProductModel] = [] 
    @State private var navigationPath = NavigationPath()
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Shorties")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
         
            if shortiesProducts.isEmpty {
                ProgressView("Loading...")
                    .padding()
            } else {
                ProductContainer(products: shortiesProducts,navigationPath:$navigationPath) 
            }
            
            Spacer()
        }
        .onAppear {
            
            productService.getAllProductsByCategory(category: "shorties") { result in
                switch result {
                case .success(let fetchedProducts):
                    shortiesProducts = fetchedProducts
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
