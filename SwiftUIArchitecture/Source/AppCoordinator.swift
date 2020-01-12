//
//  AppCoordinator.swift
//  SwiftUIArchitecture
//
//  Created by Stephan Schulz on 07.01.20.
//  Copyright © 2020 Stephan Schulz. All rights reserved.
//

import Store
import SwiftUIRouter

// MARK: - Types

typealias AppStore = SerializableStore<AppState>
typealias AppRouter = Router<RouterView<RootView>>

// MARK: - AppCoordinator

class AppCoordinator {
    // MARK: - Constants

    let store: AppStore
    let router: AppRouter

    // MARK: - Init

    init(_ state: AppState) {
        store = AppStore(model: state, diffing: .sync)
        let routerView = RouterView(store: store, RootView())
        router = Router(content: { routerView })

        initializeStyling()
    }

    private func initializeStyling() {
        Interface.applyStyling()
    }
}
