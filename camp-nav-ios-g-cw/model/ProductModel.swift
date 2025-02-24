import Foundation

struct ProductModel {
    // Properties
    var id: String? // Document ID from Firestore
    var imageUrl: String
    var name: String
    var price: Double
    var availability: Bool
    var category: String
    
    // Initializer
    init(id: String? = nil, imageUrl: String, name: String, price: Double, availability: Bool, category: String) {
        self.id = id
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.availability = availability
        self.category = category
    }
    
    // Convenience initializer from Firestore document
    init?(documentId: String, dictionary: [String: Any]) {
        guard let imageUrl = dictionary["imageUrl"] as? String,
              let name = dictionary["name"] as? String,
              let price = dictionary["price"] as? Double,
              let availability = dictionary["availability"] as? Bool,
              let category = dictionary["category"] as? String else {
            return nil
        }
        
        self.init(id: documentId, imageUrl: imageUrl, name: name, price: price, availability: availability, category: category)
    }
    
    // Convert model to a dictionary (useful for Firestore)
    func toDictionary() -> [String: Any] {
        return [
            "imageUrl": imageUrl,
            "name": name,
            "price": price,
            "availability": availability,
            "category": category
        ]
    }
}
