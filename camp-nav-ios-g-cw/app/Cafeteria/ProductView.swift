import SwiftUI

struct ProductView: View {
    private var productService = ProductService()
    @State private var products: [ProductModel] = []
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .leading){
                // Header
                ViewTitleContainer(
                    title: "Cafeteria",
                    subtitle: "Ready to start something?"
                )
                .padding()
                
                // Category Container
                CategoryContainer { category in
                    switch category {
                    case .dining:
                        navigationPath.append("DiningView")
                    case .fastFood:
                        navigationPath.append("ShortiesView")
                    case .drinks:
                        navigationPath.append("DrinksView")
                    }
                }
                .padding()
                
                Text("Recent")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                // Product Container
                if products.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    ProductContainer(products: products)
                }
                            
                
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "DiningView":
                    DiningView()
                case "ShortiesView":
                    ShortiesView()
                case "DrinksView":
                    DrinksView()
                default:
                    EmptyView()
                }
            } .onAppear {
                // Fetch products when the view appears
                productService.getAllProducts { result in
                    switch result {
                    case .success(let fetchedProducts):
                        products = fetchedProducts // Update the state with fetched products
                    case .failure(let error):
                        print("Error fetching products: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
