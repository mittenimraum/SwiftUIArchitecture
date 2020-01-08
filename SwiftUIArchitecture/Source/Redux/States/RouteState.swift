//
//  RouteState.swift
//  SwiftUIArchitecture
//
//  Created by Stephan Schulz on 07.01.20.
//  Copyright © 2020 Stephan Schulz. All rights reserved.
//

import SwiftUIRouter

struct RouteState {
    // MARK: - Variables

    var path: RoutePath = .onboarding
    var history: HistoryData?
}
