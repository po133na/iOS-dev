//
//  NewsView.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct Smth: View {
    @State var searchText: String = ""
    @State private var isNavigateToEverything = false
    @ObservedObject var list: GetData
    
    init(searchText: String = "apple") {
        self.list = GetData(search: searchText)
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search", text: $searchText, onCommit: {
                    // When user presses return/done after typing search text
                    // Update the search query for GetData
                    list.search = searchText
                    isNavigateToEverything = true
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Spacer()
                
                // Use NavigationLink to navigate to Everything view
                NavigationLink(
                    destination: TopHeadlinesNews(newsAbout: searchText, navTitle: "news"),
                    isActive: $isNavigateToEverything
                ) {
                    EmptyView()
                }
                .hidden()
                
            }
        }
    }

}




struct TopHeadlinesNews: View {
    @State var newsAbout: String = "apple"
    @State var navTitle: String = ""
    @ObservedObject var list: GetData
    
    init (newsAbout: String, navTitle: String) {
        self.list = GetData(search: newsAbout)
        self.navTitle = navTitle
    }
    
    var body: some View {
        NavigationView {
            List(list.datas) { i in
                
                NavigationLink(destination: WebView(url: i.url)
                    .navigationBarTitle("", displayMode: .inline)) {
                        
                    VStack(spacing: 15) {
                        
                        if i.image != "" {
                            WebImage(url: URL(string: i.image)!, options: .highPriority, context: nil)
                                .resizable()
                                .frame(height: 195)
                                .cornerRadius(20)
                        }
                        VStack(alignment: .leading, spacing: 10) {
                        
                            Text(i.title)
                                .fontWeight(.heavy)
                            Text(i.desc)
                                .lineLimit(5)
                        }
                        
                    }.padding(.vertical, 16)
                }
            }.navigationTitle(navTitle)
        }
    }
}
