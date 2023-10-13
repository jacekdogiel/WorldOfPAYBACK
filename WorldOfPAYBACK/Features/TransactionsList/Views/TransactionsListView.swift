//
//  TransactionsListView.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

struct TransactionsListView: View {
    @StateObject var viewModel: TransactionsListViewModel
    var navigateToDetail: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                content
            }
            .navigationTitle("transactions_list")
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            loadingView
        } else if viewModel.isError {
            errorView
        } else {
            transactionsView
        }
    }

    private var loadingView: some View {
        VStack {
            Text("loading_transactions")
                .padding()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }

    private var errorView: some View {
        VStack {
            Text("error_transactions")
                .foregroundColor(.red)
                .padding()
            Button("retry") {
                Task {
                    await viewModel.loadTransactions()
                }
            }
        }
    }

    private var transactionsView: some View {
        VStack(alignment: .trailing) {
            filterPicker
            transactionsList
            sumText
        }
    }

    private var filterPicker: some View {
        Picker("filter_by_category", selection: $viewModel.selectedCategory) {
            ForEach(viewModel.categories.sorted(), id: \.self) { category in
                if category == -1 {
                    Text("all").tag(category)
                } else {
                    Text("\("category".localized) \(category)").tag(category)
                }
            }
        }
        .onChange(of: viewModel.selectedCategory) { newValue in
            viewModel.filterTransactions()
        }
        .padding(10)
    }

    private var transactionsList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(viewModel.filteredTransactions.sorted(by: { $0.transactionDetail.bookingDate > $1.transactionDetail.bookingDate })) { transaction in
                    TransactionRowView(transaction: transaction)
                        .onTapGesture { [navigateToDetail] in
                            viewModel.selectedTransaction = transaction
                            navigateToDetail()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                }
            }
            .transaction { $0.animation = .none }
            .padding()
        }
        .refreshable {
            Task {
                await viewModel.loadTransactions()
            }
        }
    }

    private var sumText: some View {
        Text("\("sum".localized): \(viewModel.displaySum())")
            .font(.headline)
            .padding(16)
    }

}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView(
            viewModel: TransactionsListViewModel(
                transactionLoader: MockTransactionLoader()
            ),
            navigateToDetail: {}
        )
    }
}
