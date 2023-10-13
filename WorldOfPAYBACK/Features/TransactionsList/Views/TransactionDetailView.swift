//
//  TransactionDetailView.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//
import SwiftUI

struct TransactionDetailView: View {
    @StateObject var router: ListRouter
    let transaction: Transaction

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Text("\("partner".localized): \(transaction.partnerDisplayName)")
                    .font(.headline)
                
                Text("\("description".localized): \(transaction.transactionDetail.description ?? "n_a".localized)")
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
            .navigationBarItems(leading: Button("back") {
                router.navigateBack()
            })
        }
    }
}
