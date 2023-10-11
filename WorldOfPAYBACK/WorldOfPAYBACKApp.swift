//
//  WorldOfPAYBACKApp.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

@main
struct WorldOfPAYBACKApp: App {
    var body: some Scene {
        WindowGroup {
            TransactionsListView(
                viewModel: TransactionsListViewModel(
                    transactionLoader: MockTransactionLoader(
                        sleepTime: 1_000_000_000,
                        showError: Bool.random()
                    )
                )
            )
        }
    }
}
