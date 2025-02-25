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
        //DummyDataService().addDummyData()
    }
    var body: some View {
        ProductView()
    }
}

#Preview {
    ContentView()
}
