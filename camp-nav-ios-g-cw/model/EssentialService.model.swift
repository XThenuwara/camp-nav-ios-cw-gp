import Foundation

struct UniversityService: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let location: String
    let hours: String
    let phone: String
    let email: String
}
