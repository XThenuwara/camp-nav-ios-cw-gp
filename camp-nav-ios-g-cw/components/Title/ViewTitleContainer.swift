import SwiftUI

struct ViewTitleContainer: View {
    let title: String
    let subtitle: String?
    
    init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}


struct ViewTitleContainer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          
            ViewTitleContainer(
                title: "Cafeteria",
                subtitle: "Ready to start something?"
            )
            .previewLayout(.sizeThatFits)
            .padding() // Optional: Additional padding around the preview
        }
    }
}
