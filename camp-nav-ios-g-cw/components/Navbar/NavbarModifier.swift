import SwiftUI

struct WithNavbar: ViewModifier {
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            Navbar()
        }
    }
}

extension View {
    func withNavbar() -> some View {
        modifier(WithNavbar())
    }
}