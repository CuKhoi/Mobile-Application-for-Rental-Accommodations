//
//  ContentView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI

struct MainView: View {
    @Environment(ModelData.self) var modelData
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        //accountView
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            //LoginView()
        } else {
            LogInRegisterView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CollectionView()
                .tabItem {
                    Label("Collection", systemImage: "command")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
        //.environment(ModelData())
}
