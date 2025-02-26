//
//  SchedulesView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-22.
//
import SwiftUI

struct SchedulesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedBatch: String = "Batch"
    @State private var selectedModule: String = "Module"
    @State private var searchText: String = ""
    
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
        let filtered = schedules.filter { schedule in
            let batchMatch = selectedBatch == "Batch" || schedule.batch == selectedBatch
            let moduleMatch = selectedModule == "Module" || schedule.module == selectedModule
            
            if searchText.isEmpty {
                return batchMatch && moduleMatch
            }
            
            let searchMatch = schedule.module.lowercased().contains(searchText.lowercased()) ||
                            schedule.batch.lowercased().contains(searchText.lowercased()) ||
                            schedule.location.lowercased().contains(searchText.lowercased())
            
            return batchMatch && moduleMatch && searchMatch
        }
        return filtered
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("Schedules")
                    .font(Font.custom("Lexend-Medium", size: 36))
                    .fontWeight(.bold)
                
                Text("READY TO START SOMETHING?")
                    .font(Font.custom("QuickSand-Regular", size: 12))
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            Spacer()
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search schedules...", text: $searchText)
            }

            .padding(.all, 16)
            .background(Color.white)
            .cornerRadius(50)
            .padding(.horizontal)
            
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
                .background(Color.white)
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
                .background(Color.white)
                .cornerRadius(50)
                .pickerStyle(.menu)
                .accentColor(.black)
            }
            .padding()
            
            // Schedule List
            List {
                ForEach(filteredSchedules) { schedule in
                    LectureScheduleCard(lectureSchedule: schedule)
                        .listRowBackground(Color.backgroundGray)
                }
            }
            .scrollContentBackground(.hidden)
            .cornerRadius(10)
            .listStyle(PlainListStyle())
            .background(.backgroundGray)
        }
        .navigationBarBackButtonHidden(false)
        .withNavbar()
        .background(.backgroundGray)
    }

}

#Preview {
    NavigationStack {
        SchedulesView()
    }
}
