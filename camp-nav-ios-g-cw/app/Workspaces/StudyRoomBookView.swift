import SwiftUI
struct StudyRoomBookView:View{
    var body: some View {
        VStack{
            LibrarySpaceBookingForm(type:"Study Room")
        }
    }
}

#Preview {
    StudyRoomBookView()
}

