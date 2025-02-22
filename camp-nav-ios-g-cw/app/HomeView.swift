//
//  HomeView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-15.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("CAMPUS")
                    .font(Font.custom("Lexend-Medium", size: 24))
                    .fontWeight(.bold)
                    .lineLimit(nil)
                
                
                Text("NAVIGATOR")
                    .font(Font.custom("Lexend-Medium", size: 24))
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Lecture Schedule Cards
                    ScrollView {
                        VStack(spacing: 12) {
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                day: "Monday",
                                time: "1.00Pm",
                                location: "LH 35",
                                title: "IOS Lecture",
                                batch: "Batch 23.1"
                            ))
                            
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                day: "Monday",
                                time: "3.00Pm",
                                location: "LH 35",
                                title: "IOS Lecture",
                                batch: "Batch 23.1"
                            ))
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                day: "Monday",
                                time: "3.00Pm",
                                location: "LH 35",
                                title: "IOS Lecture",
                                batch: "Batch 23.1"
                            ))
                        }
                        .padding(.all)
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .background(.backgroundGray)
                        .cornerRadius(16)
                    }
                    .frame(height: 315)
                    
                    // Status Cards
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                        // Cafeteria Card
                        InfoCard(title: "Cafeteria Crowd Level", lastUpdated: "Last Updated: 1 min ago", value: "LOW")
                        
                        // Library Card
                        InfoCard(title: "Library Available Seats", lastUpdated: "Last Updated: 1 min ago", value: "10/34")
                    }
                    .padding(.horizontal)
                    
                    // Contact Card
                    VStack(alignment: .leading) {
                        Text("Contact")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
            .padding(.all, 8)
            .cornerRadius(24)
            
            // Search Bar
            Navbar(title: "Search", menuIcon: "line.horizontal.3")
        }
    }
}

#Preview {
    HomeView()
}
