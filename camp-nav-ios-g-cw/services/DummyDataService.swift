import Foundation
import FirebaseFirestore

class DummyDataService {
    private let db = Firestore.firestore()
    private let collectionName = "products" // Firestore collection name
    
    // Add dummy data to Firestore
    func addDummyData() {
        let dummyProducts = [
            ProductModel(
                imageUrl: "https://images.unsplash.com/photo-1541745537411-b8046dc6d66c?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                name: "Pizza",
                price: 699.99,
                availability: true,
                category: "dining"
            ),
            ProductModel(
                imageUrl: "https://images.unsplash.com/photo-1553909489-cd47e0907980?q=80&w=1325&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                name: "Sandvich",
                price: 1299.99,
                availability: true,
                category: "dining"
            ),
            ProductModel(
                imageUrl: "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                name: "Hamburg",
                price: 1299.99,
                availability: true,
                category: "shorties"
            ),
            ProductModel(
                imageUrl: "https://images.unsplash.com/photo-1515442261605-65987783cb6a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                name: "Coffee",
                price: 199.99,
                availability: false,
                category: "drinks"
            )
        ]
        
        // Add each product to Firestore
        for product in dummyProducts {
            let data = product.toDictionary()
            db.collection(collectionName).addDocument(data: data) { error in
                if let error = error {
                    print("Error adding product: \(product.name), Error: \(error.localizedDescription)")
                } else {
                    print("Product added successfully: \(product.name)")
                }
            }
        }
    }
}
