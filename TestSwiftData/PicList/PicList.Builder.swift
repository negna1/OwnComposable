//
//  PicList.Builder.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 22.12.23.
//

import Foundation
import SwiftUI
import NetworkLayer

@MainActor
extension Binding where Value == PicList.Store {
    func send(newAction: PicList.Action) async {
        await wrappedValue.send(newAction)
    }
}

extension PicList {
    class Builder: ObservableObject {
        init(state: PicList.State = .init(),
             action: PicList.Action = .viewDidLoad,
             env: PicList.Environment = .init(),
             reducer: @escaping (inout State,inout Action,inout Environment) async -> ()) {
            self.store = Store(state: state,
                               action: action,
                               environment: env,
                               reducer: reducer)
        }
        @Published var store: Store 
    }
    
    static func build() -> PicListView {
        PicListView(builder: Builder(reducer: PicList.reducer))
    }
    
    struct Store: Equatable {
        static func == (lhs: PicList.Store, rhs: PicList.Store) -> Bool {
            lhs.state == rhs.state
        }
        
        var state: State
        var action: Action
        var environment: Environment
        var reducer: (inout State,inout Action,inout Environment) async ->  ()
        
        mutating func send(_ newAction: Action) async {
            action = newAction
            await reducer(&state, &action, &environment)
        }
    }
}
