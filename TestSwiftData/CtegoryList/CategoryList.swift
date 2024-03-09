//
//  CategoryList.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 16.11.23.
//

import Foundation

struct CategoryList {
    struct State: Equatable {
        var type: CategoryListStateType = .loading
        var presentCreateNewCategory: Bool = false
        var presentSetUp: Bool = false
    }
    
    enum Action: Equatable {
        case viewDidLoad
        case navigateDetails
        case navigateSetUp
    }
    
    struct Environment {
        var fetchList: () async -> [String]
    }
    
    static let reducer: (inout State,inout Action,inout Environment) async -> () = {(state, action, environment) in
        switch action {
        case .viewDidLoad:
            let v = await environment.fetchList()
            state.type = .categoryList(v)
        case .navigateDetails:
            state.presentCreateNewCategory = true
        case .navigateSetUp:
            state.presentSetUp = true
        }
    }
}

extension CategoryList.State {
    enum CategoryListStateType: Equatable {
        case loading
        case categoryList([String])
    }
}
