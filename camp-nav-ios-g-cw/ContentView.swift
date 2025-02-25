//
//  ContentView.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-15.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    init(){
        FirebaseApp.configure()
       
    }
    var body: some View {
        AllSpacesView()
    }
}

#Preview {
    ContentView()
}
