//
//  LibraryView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-26.
//
import SwiftUI

struct WorkspacesView: View {
    @State private var selectedSpace: String?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Library, Study & Computer Lab")
                        .font(Font.custom("Lexend-Medium", size: 36))
                        .fontWeight(.bold)
                    
                    Text("READY TO START SOMETHING?")
                        .font(Font.custom("QuickSand-Regular", size: 12))
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Dashboard Cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        VStack(spacing: 12) {
                            InfoCard(
                                title: "Library Available Space",
                                lastUpdated: "Last Updated: 2 min ago",
                                value: "15/30"
                            )
                            
                            Button(action: {
                                selectedSpace = "library"
                            }) {
                                Text("Reserve Space")
                                    .font(Font.custom("Lexend-Medium", size: 14))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(50)
                            }
                        }
                        
                        VStack(spacing: 12) {
                            InfoCard(
                                title: "Study Available Space",
                                lastUpdated: "Last Updated: 2 min ago",
                                value: "3/32"
                            )
                            
                            Button(action: {
                                selectedSpace = "study"
                            }) {
                                Text("Reserve Space")
                                    .font(Font.custom("Lexend-Medium", size: 14))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(50)
                            }
                        }
                        
                        VStack(spacing: 12) {
                            InfoCard(
                                title: "ComputerLab Available Space",
                                lastUpdated: "Last Updated: 2 min ago",
                                value: "8/41"
                            )
                            
                            Button(action: {
                                selectedSpace = "computerlab"
                            }) {
                                Text("Reserve Space")
                                    .font(Font.custom("Lexend-Medium", size: 14))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 20)
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(50)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Recent Bookings Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Recent Bookings")
                        .font(Font.custom("Lexend-Medium", size: 24))
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    SpaceBookingContainer(type: "all")
                        .padding(.horizontal)
                }
                .padding(.top, 24)
            }
            .padding(.vertical)
        }
        .withNavbar()
        .background(.backgroundGray)
        .sheet(item: Binding(
            get: { selectedSpace.map { ReservationType(rawValue: $0)! } },
            set: { selectedSpace = $0?.rawValue }
        )) { type in
            DrawerModal(isOpen: Binding(
                get: { selectedSpace != nil },
                set: { if !$0 { selectedSpace = nil } }
            )) {
                NavigationStack {
                    switch type {
                    case .library:
                        LibrarySpaceBookView()
                    case .study:
                        StudyRoomBookView()
                    case .computerlab:
                        ComputerRoomBookView()
                    }
                }
            }
        }
    }
}

enum ReservationType: String, Identifiable {
    case library, study, computerlab
    var id: String { self.rawValue }
}

#Preview {
    NavigationStack {
        WorkspacesView()
    }
}

