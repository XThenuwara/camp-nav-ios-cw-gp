//
//  NabarDrawer.swift
//  camp-nav-ios-g-cw
//
//  Created by Yasas Hansaka Thenuwara on 2025-02-22.
//

// give me a page with a search functionality
import SwiftUI

struct NavigationItem: Identifiable, Hashable {
  let id: String
  let view: AnyView
  let label: String
  let icon: String

  static func == (lhs: NavigationItem, rhs: NavigationItem) -> Bool {
    lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

struct NavbarDrawer: View {
  @State private var searchText = ""
  @State private var selectedItem: NavigationItem?

  let navigationItems: [NavigationItem] = [
    NavigationItem(
      id: "home",
      view: AnyView(HomeView()),
      label: "Home",
      icon: "house"
    ),
    NavigationItem(
      id: "schedule",
      view: AnyView(ScheduleView()),
      label: "Schedule",
      icon: "calendar"
    ),
    NavigationItem(
      id: "cafeteria",
      view: AnyView(Text("Cafeteria View")),
      label: "Cafeteria",
      icon: "fork.knife"
    ),
    NavigationItem(
      id: "library",
      view: AnyView(Text("Library View")),
      label: "Library",
      icon: "book"
    ),
    NavigationItem(
      id: "map",
      view: AnyView(Text("Map View")),
      label: "Map",
      icon: "map"
    ),
    NavigationItem(
      id: "information",
      view: AnyView(Text("Contact View")),
      label: "information",
      icon: "info.circle"
    ),
  ]

  var filteredItems: [NavigationItem] {
    if searchText.isEmpty {
      return navigationItems
    }
    return navigationItems.filter { item in
      item.label.lowercased().contains(searchText.lowercased())
    }
  }

  var body: some View {
    NavigationStack {
      VStack {
        VStack(alignment: .leading) {
          Text("Search")
            .font(Font.custom("Lexend-Medium", size: 32))
            .fontWeight(.bold)
            .padding(.top, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        HStack {
          Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
          TextField("Search", text: $searchText)
        }
        .padding()
        .background(.backgroundGray)
        .cornerRadius(100)
        .padding(.horizontal)

        let columns = [
          GridItem(.flexible()),
          GridItem(.flexible()),
        ]

        ScrollView {
          LazyVGrid(columns: columns, spacing: 16) {
            ForEach(filteredItems) { item in
                Button(action: {
                    selectedItem = item
                }) {
                    VStack {
                        Image(systemName: item.icon)
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(.backgroundGray)
                            .clipShape(Circle())

                        Text(item.label)
                            .font(Font.custom("Lexend-Medium", size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
    }
    .background(.backgroundGray)
}
.fullScreenCover(item: $selectedItem) { item in
    NavigationStack {
        item.view
    }
}
    }
  }
}

#Preview {
  NavbarDrawer()
}

    
