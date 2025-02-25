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
                    .background(Color.backgroundGray)
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
                        .background(Color.backgroundGray)
                        .cornerRadius(50)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
            )
            .sheet(isPresented: $isMenuOpen) {
                DrawerMenu(isOpen: $isMenuOpen)
            }
        }
    }
}

struct DrawerMenu: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Drawer Handle
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 15)
                    .foregroundColor(.backgroundGray)
                    .padding()
                Spacer()
            }.onTapGesture {
                withAnimation {
                    isOpen.toggle()
                }
            }
            
            // Drawer Content
            SearchDrawer()
                .frame(maxWidth: .infinity)
        }
        .background(Color.white)
        .transition(.move(edge: .bottom))
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    Navbar()
}
