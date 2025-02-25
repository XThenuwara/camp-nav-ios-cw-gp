import SwiftUI

struct LibrarySpaceBookingForm: View {
    let type :String
    @State private var role: String = ""
    @State private var date: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date().addingTimeInterval(3600) // Default to 1 hour later
    @State private var seatNumber: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    private let librarySpaceService = SpaceService()
    
    init(type: String) {
            self.type = type
        }
    
    var body: some View {
        Form {

            Section(header: Text("Role")) {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                    TextField("Enter Role (A-G)", text: $role)
                        .keyboardType(.default)
                }
            }
            
    
            Section(header: Text("Date")) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    DatePicker("Select Date", selection: $date, displayedComponents: .date)
                }
            }
            
    
            Section(header: Text("Start Time")) {
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.gray)
                    DatePicker("Select Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                }
            }
            
    
            Section(header: Text("End Time")) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    DatePicker("Select End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                }
            }
            

            Section(header: Text("Seat Number")) {
                HStack {
                    Image(systemName: "number")
                        .foregroundColor(.gray)
                    TextField("Enter Seat Number", text: $seatNumber)
                        .keyboardType(.numberPad)
                }
            }
            
    
            Section {
                Button(action: submitBooking) {
                    HStack {
                        Spacer()
                        Text("Submit Booking")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Book \(type) Space")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Booking Status"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")))
        }
    }
    

    private func submitBooking() {
     
        guard !role.isEmpty, role.count == 1, "ABCDEFG".contains(role.uppercased()) else {
            alertMessage = "Please enter a valid role (A-G)."
            showAlert = true
            return
        }
        
        guard let seatNumberInt = Int(seatNumber), seatNumberInt > 0 else {
            alertMessage = "Please enter a valid seat number."
            showAlert = true
            return
        }
        
        guard startTime < endTime else {
            alertMessage = "End time must be after start time."
            showAlert = true
            return
        }
        
      
        librarySpaceService.isSpaceAvailable(
            role: role.uppercased(),
            seatNumber: seatNumberInt,
            date: date,
            startTime: startTime,
            endTime: endTime,
            type:"library"
        ) { result in
            switch result {
            case .success(let isAvailable):
                if isAvailable {
                   
                    let newSpace = Space(
                        id: "",
                        userId: "user123",
                        role: role.uppercased(),
                        date: date,
                        startTime: startTime,
                        endTime: endTime,
                        seatNumber: seatNumberInt,
                        type: type
                    )
                    
           
                    librarySpaceService.createSpace(space: newSpace) { result in
                        switch result {
                        case .success(let message):
                            alertMessage = message
                            showAlert = true
                            resetForm()
                        case .failure(let error):
                            alertMessage = "Error: \(error.localizedDescription)"
                            showAlert = true
                        }
                    }
                } else {
             
                    alertMessage = "The selected space is not available for the given time slot."
                    showAlert = true
                }
            case .failure(let error):
                alertMessage = "Error checking availability: \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
    

    private func resetForm() {
        role = ""
        date = Date()
        startTime = Date()
        endTime = Date().addingTimeInterval(3600)
        seatNumber = ""
    }
}


struct LibrarySpaceBookingForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LibrarySpaceBookingForm(type:"Library")
        }
    }
}
