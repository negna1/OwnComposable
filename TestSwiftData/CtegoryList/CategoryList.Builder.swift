//
//  CategoryList.Builder.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 16.11.23.
//

import Foundation
import SwiftUI

@MainActor
extension Binding where Value == CategoryList.Store {

    func send(newAction: CategoryList.Action) async {
        await wrappedValue.send(newAction)
    }
}

extension CategoryList {
    
    class Builder: ObservableObject {
        @Published var store = Store(state: .init(),
                                     action: .viewDidLoad,
                                     environment: .init(fetchList: {
            return ["Mei Mui", "Mui Mei"]
        }),
                                     reducer: CategoryList.reducer)
       
    }
    
    static func build() -> some View{
        NavigationStack {
            CategoryListView(builder: Builder())
        }
    }
    
    struct Store: Equatable {
        static func == (lhs: CategoryList.Store, rhs: CategoryList.Store) -> Bool {
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
