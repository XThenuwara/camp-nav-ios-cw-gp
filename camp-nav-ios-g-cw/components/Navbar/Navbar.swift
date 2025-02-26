//
//  Navbar.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-15.
//
import SwiftUI


struct Navbar: View {
    @State private var isMenuOpen = false
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                // Search Button
                Button(action: {
                    withAnimation {
                        isMenuOpen.toggle()
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(50)
                }
                
                // Menu Button
                Button(action: {
                    withAnimation {
                        isMenuOpen.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(Color.primary)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .cornerRadius(50)
                }
            }
            .padding()
             .background(Color.clear)
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $isMenuOpen) {
                DrawerModal(isOpen: $isMenuOpen) {
                    SearchDrawer()
                }
            }
        }
    }
}



#Preview {
    Navbar()
}
