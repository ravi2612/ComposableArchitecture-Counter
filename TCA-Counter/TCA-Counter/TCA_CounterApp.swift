//
//  TCA_CounterApp.swift
//  TCA-Counter
//
//  Created by Ravi navarro on 15/10/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_CounterApp: App {
    var body: some Scene {
        WindowGroup {
           ContentView(store: Store(initialState: State(), reducer: reducer, environment: Environment()))
        }
    }
}
