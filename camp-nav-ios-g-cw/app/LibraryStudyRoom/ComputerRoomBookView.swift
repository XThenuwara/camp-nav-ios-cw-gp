import SwiftUI
struct ComputerRoomBookView:View{
    var body: some View {
        VStack{
            Image(.librarySpace)
            LibrarySpaceBookingForm(type:"Computer Room")
        }
    }
}

#Preview {
    ComputerRoomBookView()
}

