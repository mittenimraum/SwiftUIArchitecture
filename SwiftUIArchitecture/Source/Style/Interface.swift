//
//  Interface.swift
//  SwiftUIArchitecture
//
//  Created by Stephan Schulz on 09.01.20.
//  Copyright © 2020 Stephan Schulz. All rights reserved.
//

import Foundation
import UIKit

struct Interface {
    static func applyStyling() {
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .white

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UITableView.appearance().separatorColor = .clear
    }
}
