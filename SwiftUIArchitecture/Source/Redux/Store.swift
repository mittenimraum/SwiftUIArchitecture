//
//  Store.swift
//  SwiftUIArchitecture
//
//  Created by Stephan Schulz on 12.01.20.
//  Copyright © 2019 Alexey Naumov. All rights reserved.
//  Copyright © 2020 Stephan Schulz. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

// MARK: - Store

typealias Store<State> = CurrentValueSubject<State, Never>

protocol Reducable where Failure: Error {
    associatedtype Output
    associatedtype Failure

    func reduce(store: CurrentValueSubject<Output, Failure>)
}

extension CurrentValueSubject {
    subscript<T>(keyPath: WritableKeyPath<Output, T>) -> T where T: Equatable {
        get {
            value[keyPath: keyPath]
        }
        set {
            var value = self.value

            if value[keyPath: keyPath] != newValue {
                value[keyPath: keyPath] = newValue
                self.value = value
            }
        }
    }

    func reduce(_ update: (inout Output) -> Void) {
        var value = self.value
        update(&value)
        self.value = value
    }

    func dispatch<Action>(_ action: Action) where Action: Reducable,
        Action.Output == Output, Action.Failure == Failure {
        action.reduce(store: self)
    }

    func subscribe<Value>(for keyPath: KeyPath<Output, Value>) -> AnyPublisher<Value, Failure> where Value: Equatable {
        return map(keyPath).removeDuplicates().eraseToAnyPublisher()
    }
}

extension Binding where Value: Equatable {
    func dispatched<State>(to state: Store<State>, _ keyPath: WritableKeyPath<State, Value>) -> Self {
        return .init(get: { () -> Value in
            self.wrappedValue
        }, set: { value in
            self.wrappedValue = value
            state[keyPath] = value
        })
    }
}
