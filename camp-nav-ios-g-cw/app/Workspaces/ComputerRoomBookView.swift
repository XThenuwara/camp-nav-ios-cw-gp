import SwiftUI
import FirebaseCore

struct ComputerRoomBookView:View{
    var body: some View {
        VStack{
            LibrarySpaceBookingForm(type:"Computer Room")
        }
    }
}

#Preview {
    ComputerRoomBookView()
}

