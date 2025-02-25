//
//  ScheduleView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-22.
//
import SwiftUI

struct ScheduleView: View {
    let schedule: LectureSchedule
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 15)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
            }.onTapGesture {
                withAnimation {
                    dismiss()
                }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                // Module Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Module")
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    Text(schedule.module)
                        .font(Font.custom("Lexend-Medium", size: 32))
                        .fontWeight(.bold)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
                
                // Batch Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Batch")
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "person.2")
                            .foregroundColor(.gray)
                        Text(schedule.batch)
                            .font(Font.custom("Quicksand-Medium", size: 18))
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
                
                // Time Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Time")
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                            Text(schedule.startTime.formatted(date: .abbreviated, time: .omitted))
                                .font(Font.custom("Quicksand-Medium", size: 18))
                        }
                        
                        HStack(spacing: 8) {
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                            Text("\(schedule.startTime.formatted(date: .omitted, time: .shortened)) - \(schedule.endTime.formatted(date: .omitted, time: .shortened))")
                                .font(Font.custom("Quicksand-Medium", size: 18))
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
                
                // Location Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Location")
                        .font(Font.custom("Lexend-Medium", size: 20))
                        .fontWeight(.semibold)
                    
                    VStack(spacing: 12) {
                        HStack() {
                            HStack(spacing: 8) {
                                Image(systemName: "location")
                                    .foregroundColor(.gray)
                                Text(schedule.location)
                                    .font(Font.custom("Quicksand-Medium", size: 18))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                               
                            }) {
                                HStack {
                                    Image(systemName: "arrow.triangle.turn.up.right.circle")
                                    Text("Get Directions")
                                        .font(Font.custom("Quicksand-Medium", size: 16))
                                }
                                .foregroundColor(.black)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 14)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(20)
                            }
                        }
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
            }
            .padding()
            .cornerRadius(32)
            .background(Color.white)
            .cornerRadius(24)
        }
        .padding(.all, 16)
        .navigationBarTitleDisplayMode(.inline)
        .background(.backgroundGray)
    }
}

#Preview {
    NavigationStack {
        ScheduleView(schedule: LectureSchedule(
            location: "LH 1",
            batch: "23.1",
            module: "iOS Development",
            startTime: Date(),
            endTime: Date().addingTimeInterval(7200)
        ))
    }
}
