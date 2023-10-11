//
//  ListRouter.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 11/10/2023.
//

import SwiftUI

enum ListView {
    case list
    case detail
}

final class ListRouter: ObservableObject {
    @Published var currentView: ListView = .list
    
    private var navigationStack: [ListView] = []

    func navigateToDetail() {
        navigationStack.append(currentView)
        currentView = .detail
    }

    func navigateBack() {
        guard let previousView = navigationStack.popLast() else {
            return
        }
        currentView = previousView
    }
}
