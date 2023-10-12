//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    @State private var showNetworkAlert = false
    
    var body: some Scene {
        WindowGroup {
            ListFeature()
                .onChange(of: networkMonitor.isConnected) { connection in
                    showNetworkAlert = connection == false
                }
                .alert(
                    "Network connection is offline.",
                    isPresented: $showNetworkAlert
                ) {}
            
            #warning("Left for development purposes")
//            TabView {
//                ListFeature()
//                    .tabItem {
//                        Label("List", systemImage: "list.bullet")
//                    }
//
//                FeedFeature()
//                    .tabItem {
//                        Label("Feed", systemImage: "newspaper")
//                    }
//
//                ShoppingFeature()
//                    .tabItem {
//                        Label("Online Shopping", systemImage: "bag")
//                    }
//
//                SettingsFeature()
//                    .tabItem {
//                        Label("Settings", systemImage: "gear")
//                    }
//            }
        }
    }
}
