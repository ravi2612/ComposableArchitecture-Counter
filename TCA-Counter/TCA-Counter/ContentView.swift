//
//  ContentView.swift
//  TCA-Counter
//
//  Created by Ravi navarro on 15/10/22.
//

import SwiftUI
import ComposableArchitecture

struct State: Equatable {
    var counter = 0
}

enum Action {
    case increaseCounter
    case decreaseCounter
}

struct Environment {
    
}

let reducer = Reducer<
State, Action, Environment
> { state, action, environment in
    switch action {
    case .increaseCounter:
        state.counter += 1
        return Effect.none
    case .decreaseCounter:
        state.counter -= 1
        return Effect.none
    }
}

struct ContentView: View {
    
    let store: Store<State, Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            
            HStack {
                Button{
                    //Action
                    viewStore.send(.decreaseCounter)
                } label: {
                    Text("-")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                
                Text(viewStore.counter.description)
                    .padding(5)
                
                Button{
                    //Action
                    viewStore.send(.increaseCounter)
                } label: {
                    Text("+")
                        .padding(10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(initialState: State(),
                         reducer: reducer,
                         environment: Environment())
        )
    }
}
