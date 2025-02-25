//
//  LectureScheduleCard.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-16.
//
import SwiftUI

struct LectureScheduleCard: View {
    var lectureSchedule: LectureSchedule
    @State private var showScheduleView = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(lectureSchedule.batch)
                    .font(Font.custom("Lexend-Medium", size: 22))
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    showScheduleView = true
                }) {
                    Text("View")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 2)
                        .background(Color.gray)
                        .cornerRadius(100)
                }
            }
            
            Text(lectureSchedule.module)
                .font(Font.custom("Quicksand-Medium", size: 20))
                .fontWeight(.semibold)
            
            VStack(alignment: .leading, spacing: 8) {
                // Date
                Text(lectureSchedule.startTime.formatted(date: .abbreviated, time: .omitted))
                    .font(Font.custom("Quicksand-Medium", size: 16))
                    .foregroundColor(.gray)
                
                // Time and Location
                HStack(spacing: 4) {
                    Text(lectureSchedule.startTime.formatted(date: .omitted, time: .shortened))
                        .font(Font.custom("Quicksand-Medium", size: 16))
                        .foregroundColor(.gray)
                    
                    Text("-")
                        .foregroundColor(.gray)
                    
                    Text(lectureSchedule.endTime.formatted(date: .omitted, time: .shortened))
                        .font(Font.custom("Quicksand-Medium", size: 16))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(lectureSchedule.location)
                        .font(Font.custom("Quicksand-Medium", size: 16))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .sheet(isPresented: $showScheduleView) {
            NavigationStack {
                ScheduleView(schedule: lectureSchedule)
            }
        }
    }
}

#Preview {
    LectureScheduleCard(lectureSchedule: LectureSchedule(
        location: "Room 101",
        batch: "23.1",
        module: "iOS Development",
        startTime: Date(),
        endTime: Date().addingTimeInterval(7200)
    ))
}
