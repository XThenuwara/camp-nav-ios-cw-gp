//
//  Navbar.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-15.
//
import SwiftUI


struct Navbar: View {
    @State private var isMenuOpen = false;
    @State private var searchText: String = ""
    var title: String
    var menuIcon: String?
    var menuDrawer: AnyView?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    withAnimation {
                        isMenuOpen.toggle()
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.backgroundGray)
                    .cornerRadius(100)
                }
                if let menuIcon = menuIcon {
                    Button(action: {
                        withAnimation {
                            isMenuOpen.toggle()
                        }
                    }) {
                        Image(systemName: menuIcon)
                            .font(.title2)
                            .foregroundColor(Color.primary)
                            .frame(width: 50, height: 50)
                            .background(.backgroundGray)
                            .cornerRadius(100)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .foregroundColor(.white)
            .sheet(isPresented: $isMenuOpen) {
                DrawerMenu(
                    isOpen: $isMenuOpen
                )
            }
            .background(Color.blue.edgesIgnoringSafeArea(.all))
        }
    }
}


struct DrawerMenu: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
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
                
                NavbarDrawer()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .offset(y: isOpen ? 0 : UIScreen.main.bounds.height)
            .animation(.easeInOut, value: isOpen)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    Navbar(
           title: "Test",
           menuIcon: "line.horizontal.3",
           menuDrawer: AnyView(Text("Hello, World!"))
    )
}
