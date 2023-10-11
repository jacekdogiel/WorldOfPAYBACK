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
                Text("Partner: \(transaction.partnerDisplayName)")
                    .font(.headline)
                
                Text("Description: \(transaction.transactionDetail.description ?? "N/A")")
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
            .navigationBarItems(leading: Button("Back") {
                router.navigateBack()
            })
        }
    }
}
