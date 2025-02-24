//
//  ContentView.swift
//  sunduskBook
//
//  Created by IosDeveloper on 2024/7/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CustomRecordsView()
                .tabItem {
                    Label("记录", systemImage: "list.bullet")
                }
                .edgesIgnoringSafeArea(.bottom)
            
            WordsView()
                .tabItem {
                    Label("单词", systemImage: "book.fill")
                }
                .edgesIgnoringSafeArea(.bottom)
        }
        .environmentObject(CardsViewModel())
    }
}

#Preview {
    ContentView()
}
