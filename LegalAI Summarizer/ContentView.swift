//
//  ContentView.swift
//  LegalAI Summarizer
//
//  Created by Артем Михайлов on 27.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {

            MainView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.crop.circle")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
