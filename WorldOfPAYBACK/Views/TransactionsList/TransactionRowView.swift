//
//  TransactionRowView.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.partnerDisplayName)
                    .foregroundColor(.black)
                    .font(.headline)
                Text("\(transaction.transactionDetail.description ?? "") - \(transaction.transactionDetail.value.formattedAmount())")
                    .foregroundColor(.gray)
                Text(transaction.transactionDetail.mediumFormattedBookingDate())
                    .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .padding()
        }
        .contentShape(Rectangle())
    }
}
