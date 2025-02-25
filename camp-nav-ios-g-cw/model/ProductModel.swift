struct ProductModel: Identifiable, Hashable{
    var id: String?
    var imageUrl: String
    var name: String
    var price: Double
    var availability: Bool
    var category: String
    var description: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    
    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
         return lhs.id == rhs.id
     }
    
    init(id: String? = nil, imageUrl: String, name: String, price: Double, availability: Bool, category: String, description: String) {
        self.id = id
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.availability = availability
        self.category = category
        self.description = description
    }
    
    init?(documentId: String, dictionary: [String: Any]) {
        guard let imageUrl = dictionary["imageUrl"] as? String,
              let name = dictionary["name"] as? String,
              let price = dictionary["price"] as? Double,
              let availability = dictionary["availability"] as? Bool,
              let category = dictionary["category"] as? String,
              let description = dictionary["description"] as? String else {
            return nil
        }
        
        self.init(id: documentId, imageUrl: imageUrl, name: name, price: price, availability: availability, category: category, description: description)
    }
    
    func toDictionary() -> [String: Any] {
        return [
            "imageUrl": imageUrl,
            "name": name,
            "price": price,
            "availability": availability,
            "category": category,
            "description": description
        ]
    }
}
