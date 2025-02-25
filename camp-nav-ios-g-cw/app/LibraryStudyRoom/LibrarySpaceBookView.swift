import SwiftUI
struct LibrarySpaceBookView:View{
    var body: some View {
        VStack{
            Image(.librarySpace)
            LibrarySpaceBookingForm(type:"Library")
        }
    }
}

#Preview {
    LibrarySpaceBookView()
}

