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
        VStack(spacing: 20) {
            Form {
                VStack(alignment: .leading, spacing: 4) {
                    Text("BOOK YOUR")
                        .font(Font.custom("Lexend-Medium", size: 24))
                        .fontWeight(.bold)
                    
                    Text("\(type.uppercased()) SPACE")
                        .font(Font.custom("Lexend-Medium", size: 24))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)
                
                Section {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .frame(width: 24)
                        TextField("Enter Role (A-G)", text: $role)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(Font.custom("Lexend-Medium", size: 16))
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(50)
                } header: {
                    Text("Role")
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                }
                
                Section {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                            .frame(width: 24)
                        DatePicker("Select Date", selection: $date, displayedComponents: .date)
                            .font(Font.custom("Lexend-Medium", size: 16))
                    }
                } header: {
                    Text("Date")
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                }
                
                Section {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.gray)
                            .frame(width: 24)
                        DatePicker("Select Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                            .font(Font.custom("Lexend-Medium", size: 16))
                    }
                } header: {
                    Text("Start Time")
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                }
                
                Section {
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(.gray)
                            .frame(width: 24)
                        DatePicker("Select End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                            .font(Font.custom("Lexend-Medium", size: 16))
                    }
                } header: {
                    Text("End Time")
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                }
                
                Section {
                    HStack {
                        Image(systemName: "number")
                            .foregroundColor(.gray)
                            .frame(width: 24)
                        TextField("Enter Seat Number", text: $seatNumber)
                            .keyboardType(.numberPad)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(Font.custom("Lexend-Medium", size: 16))
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(50)
                } header: {
                    Text("Seat Number")
                        .font(Font.custom("Lexend-Medium", size: 14))
                        .foregroundColor(.gray)
                }
                
                Section {
                    Button(action: submitBooking) {
                        Text("Book Now")
                            .font(Font.custom("Lexend-Medium", size: 16))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(50)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Booking Status"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    // Submit Booking
    private func submitBooking() {
        // Validate inputs
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
        
        // Check availability of the library space
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
                    // Space is available, create the booking
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
                    
                    // Use LibrarySpaceService to create the booking
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
                    // Space is not available, show an alert
                    alertMessage = "The selected space is not available for the given time slot."
                    showAlert = true
                }
            case .failure(let error):
                alertMessage = "Error checking availability: \(error.localizedDescription)"
                showAlert = true
            }
        }
    }
    
    // Reset Form
    private func resetForm() {
        role = ""
        date = Date()
        startTime = Date()
        endTime = Date().addingTimeInterval(3600)
        seatNumber = ""
    }
}

// Preview
struct LibrarySpaceBookingForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LibrarySpaceBookingForm(type:"Library")
        }
    }
}
