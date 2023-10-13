//
//  String+Localization.swift
//  WorldOfPAYBACK
//
//  Created by Jacek Dogiel on 13/10/2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
