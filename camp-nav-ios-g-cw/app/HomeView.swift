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
                                location: "Room 101",
                                batch: "23.1",
                                module: "iOS Development",
                                startTime: Date(),
                                endTime: Date().addingTimeInterval(7200)
                            ))
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                location: "Room 101",
                                batch: "23.1",
                                module: "iOS Development",
                                startTime: Date(),
                                endTime: Date().addingTimeInterval(7200)
                            ))
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                location: "Room 101",
                                batch: "23.1",
                                module: "iOS Development",
                                startTime: Date(),
                                endTime: Date().addingTimeInterval(7200)
                            ))
                            LectureScheduleCard(lectureSchedule: LectureSchedule(
                                location: "Room 101",
                                batch: "23.1",
                                module: "iOS Development",
                                startTime: Date(),
                                endTime: Date().addingTimeInterval(7200)
                            ))
                        }
                        .padding(.all)
                        .frame(maxWidth:.infinity, alignment:.leading)
                        .background(.backgroundGray)
                        .cornerRadius(16)
                    }
                    .frame(height: 315)
                    
          
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                   
                        InfoCard(title: "Cafeteria Crowd Level", lastUpdated: "Last Updated: 1 min ago", value: "LOW")
                        
                  
                        InfoCard(title: "Library Available Seats", lastUpdated: "Last Updated: 1 min ago", value: "10/34")
                    }
                    .padding(.horizontal)
                    
               
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
            
            
            Navbar(title: "Search", menuIcon: "line.horizontal.3")
        }
    }
}

#Preview {
    HomeView()
}
