//
//  ListFeature.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

struct ListFeature: View {
    @StateObject private var router = ListRouter()
    @StateObject private var viewModel = TransactionsListViewModel(
        transactionLoader: MockTransactionLoader(
            sleepTime: 1_000_000_000,
            showError: Bool.random()
        )
    )
    
    var body: some View {
        switch router.currentView {
        case .list:
            TransactionsListView(viewModel: viewModel) { [router] in
                router.navigateToDetail()
            }
            .transition(.opacity)
            .transaction { $0.animation = .default }
        case .detail:
            if let transaction = viewModel.selectedTransaction {
                TransactionDetailView(transaction: transaction) { [router] in
                    router.navigateBack()
                }
                    .transition(.push(from: .trailing))
                    .transaction { $0.animation = .default }
            }
        }
    }
}
