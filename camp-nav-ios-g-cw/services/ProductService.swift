import Foundation
import FirebaseFirestore

class ProductService {
    private let db = Firestore.firestore()
    private let collectionName = "products" // Firestore collection name
    
    // MARK: - Create Product
    func createProduct(product: ProductModel, completion: @escaping (Result<String, Error>) -> Void) {
        let data = product.toDictionary()
        
        db.collection(collectionName).addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Product created successfully!"))
            }
        }
    }
    
    // MARK: - Update Product
    func updateProduct(product: ProductModel, completion: @escaping (Result<String, Error>) -> Void) {
        guard let productId = product.id else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Product ID is missing"])))
            return
        }
        
        let data = product.toDictionary()
        
        db.collection(collectionName).document(productId).setData(data, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Product updated successfully!"))
            }
        }
    }
    
    // MARK: - Get All Products
    func getAllProducts(completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        db.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let products = documents.compactMap { document -> ProductModel? in
                let data = document.data()
                return ProductModel(documentId: document.documentID, dictionary: data)
            }
            
            completion(.success(products))
        }
    }
    
    // MARK: - Get All Products by Category
      func getAllProductsByCategory(category: String, completion: @escaping (Result<[ProductModel], Error>) -> Void) {
          db.collection(collectionName)
              .whereField("category", isEqualTo: category) // Query by category
              .getDocuments { snapshot, error in
                  if let error = error {
                      completion(.failure(error))
                      return
                  }
                  
                  guard let documents = snapshot?.documents else {
                      completion(.success([]))
                      return
                  }
                  
                  let products = documents.compactMap { document -> ProductModel? in
                      let data = document.data()
                      return ProductModel(documentId: document.documentID, dictionary: data)
                  }
                  
                  completion(.success(products))
              }
      }
    
    // MARK: - Get Product by ID
    func getProductById(productId: String, completion: @escaping (Result<ProductModel, Error>) -> Void) {
        db.collection(collectionName).document(productId).getDocument { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let document = snapshot, document.exists,
                  let data = document.data() else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Product not found"])))
                return
            }
            
            if let product = ProductModel(documentId: document.documentID, dictionary: data) {
                completion(.success(product))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to parse product"])))
            }
        }
    }
    
    // MARK: - Delete Product
    func deleteProduct(productId: String, completion: @escaping (Result<String, Error>) -> Void) {
        db.collection(collectionName).document(productId).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Product deleted successfully!"))
            }
        }
    }
}
