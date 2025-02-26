import SwiftUI

struct CafeteriaView: View {
    private var productService = ProductService()
    @State private var products: [ProductModel] = []
    
    var body: some View {
        ZStack {
            Color.backgroundGray.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text("Cafeteria")
                        .font(Font.custom("Lexend-Medium", size: 36))
                        .fontWeight(.bold)
                    
                    Text("READY TO START SOMETHING?")
                        .font(Font.custom("QuickSand-Regular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Category Container
                        CategoryContainer { category in }
                        
                        // Recent Products Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Recent Orders")
                                .font(Font.custom("Lexend-Medium", size: 20))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            if products.isEmpty {
                                ProgressView("Loading...")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding()
                            } else {
                                ProductContainer(products: products)
                            }
                        }
                        .padding(.vertical)
                        .background(.backgroundGray)
                        .cornerRadius(16)
                    }
                }
                .cornerRadius(24)
                
                Spacer()
            }
        }
        .onAppear {
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
        .withNavbar()
        .background(.backgroundGray)
    }
}
