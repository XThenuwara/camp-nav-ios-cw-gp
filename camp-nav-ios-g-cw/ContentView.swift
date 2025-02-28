//
//  ContentView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-15.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            HomeView()
                .navigationDestination(for: String.self) { destination in
                    switch destination {
                    case "SchedulesView":
                        SchedulesView()
                    case "CafeteriaView":
                        CafeteriaView()
                    case "WorkspacesView":
                        WorkspacesView()
                    case "MapView":
                        MapView()
                    case "EssentialServicesView":
                        EssentialServicesView()
                    default:
                        EmptyView()
                    }
                }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NavigateToView"))) { notification in
            if let destination = notification.userInfo?["destination"] as? String {
                navigationPath = NavigationPath()
                
                switch destination {
                case "schedule":
                    navigationPath.append("SchedulesView")
                case "cafeteria":
                    navigationPath.append("CafeteriaView")
                case "Workspaces":
                    navigationPath.append("WorkspacesView")
                case "map":
                    navigationPath.append("MapView")
                case "information":
                    navigationPath.append("EssentialServicesView")
                default:
                    break
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
