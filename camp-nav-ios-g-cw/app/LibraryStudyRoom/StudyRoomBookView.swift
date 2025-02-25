import SwiftUI
struct StudyRoomBookView:View{
    var body: some View {
        VStack{
            Image(.librarySpace)
            LibrarySpaceBookingForm(type:"Study Room")
        }
    }
}

#Preview {
    StudyRoomBookView()
}

