//
//  ScheduleView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-22.
//
import SwiftUI

struct SchedulesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedBatch: String = "Batch"
    @State private var selectedModule: String = "Module"
    
    // Sample data
    let schedules = [
        LectureSchedule(
            location: "LH 1",
            batch: "23.1",
            module: "iOS Development",
            startTime: Date(),
            endTime: Date().addingTimeInterval(7200)
        ),
        LectureSchedule(
            location: "LH 1",
            batch: "23.2",
            module: "iOS Development",
            startTime: Date(),
            endTime: Date().addingTimeInterval(7200)
        ),
    ]
    
    var batches: [String] {
        ["Batch"] + Array(Set(schedules.map { $0.batch })).sorted()
    }
    
    var modules: [String] {
        ["Module"] + Array(Set(schedules.map { $0.module })).sorted()
    }
    
    var filteredSchedules: [LectureSchedule] {
        schedules.filter { schedule in
            (selectedBatch == "Batch" || schedule.batch == selectedBatch) &&
            (selectedModule == "Module" || schedule.module == selectedModule)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Picker("Batch", selection: $selectedBatch) {
                    ForEach(batches, id: \.self) { batch in
                        Text(batch)
                            .foregroundColor(.black)
                            .tag(batch)
                    }
                }
                .padding(.horizontal, 8)
                .background(.backgroundGray)
                .cornerRadius(50)
                .pickerStyle(.menu)
                .accentColor(.black)
                
                Picker("Module", selection: $selectedModule) {
                    ForEach(modules, id: \.self) { module in
                        Text(module)
                            .foregroundColor(.black)
                            .tag(module)
                    }
                }
                .padding(.horizontal, 8)
                .background(.backgroundGray)
                .cornerRadius(50)
                .pickerStyle(.menu)
                .accentColor(.black)
            }
            .padding()
            
            // Schedule List
            List {
                ForEach(filteredSchedules) { schedule in
                    NavigationLink(destination: ScheduleView(schedule: schedule)) {
                        LectureScheduleCard(lectureSchedule: schedule)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                            .padding(.bottom, 8)
                    }
                    .listRowBackground(Color.backgroundGray)
                }
            }
            .scrollContentBackground(.hidden)
            .cornerRadius(10)
            .listStyle(PlainListStyle())
            .background(.backgroundGray)
        }
        .navigationTitle("Schedule")
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    NavigationStack {
        SchedulesView()
    }
}
