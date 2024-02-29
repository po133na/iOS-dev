//
//  ContentView.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import SwiftUI
import SwiftyJSON



struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            TopHeadlinesNews(newsAbout: "apple", navTitle: "News about Apple")
                .tabItem {
                    if selectedTab == 0 {
                        Label("Top headlines", systemImage: "newspaper")
                    } else {
                        Label("Top headlines", systemImage: "newspaper")
                    }
                }.tag(0)
            
            NavigationView {
                Smth()
                .navigationTitle("Search")
            }.tabItem {
                    if selectedTab == 1 {
                        Label("Search", systemImage: "magnifyingglass")
                    } else {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }.tag(1)
        }
    }
}




#Preview {
    ContentView()
}
