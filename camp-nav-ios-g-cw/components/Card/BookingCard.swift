import SwiftUI

struct BookingCard: View {
    let space: Space
    @State private var showAlert = false
    

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }()
    

    private var headerView: some View {
        HStack {
            Text("Book Space")
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            Button(action: { showAlert = true }) {
                Text("View")
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.gray.opacity(0.3))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
        }
    }
    
    private var spaceInfoView: some View {
        VStack(alignment: .leading) {
            Text(space.type)
                .font(.subheadline)
                .foregroundColor(.black.opacity(0.8))
            
            Text("Seat No: \(space.seatNumber)")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private var timeAndDateView: some View {
        HStack {
            Text(timeFormatter.string(from: space.startTime))
                .font(.caption)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(dateFormatter.string(from: space.date))
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private var alertContent: String {
        """
        Role: \(space.role)
        Type: \(space.type)
        Seat No: \(space.seatNumber)
        Date: \(dateFormatter.string(from: space.date))
        Start Time: \(timeFormatter.string(from: space.startTime))
        End Time: \(timeFormatter.string(from: space.endTime))
        """
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            headerView
            spaceInfoView
            Spacer()
            timeAndDateView
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Booking Details"),
                message: Text(alertContent),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
