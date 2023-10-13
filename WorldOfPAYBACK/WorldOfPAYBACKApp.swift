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
                    "network_offline",
                    isPresented: $showNetworkAlert
                ) {}
        }
    }
}
