//
//  PicList.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 22.12.23.
//

import Foundation
import NetworkLayer

struct PicList {
    struct State: Equatable {
        var type: PicListStateType = .loading
    }
    
    enum Action: Equatable {
        case viewDidLoad
    }
    
    struct Environment {
        var fetchExercises: () async -> Result <String, ErrorType> = {
            let networkLayer = NetworkLayer()
            var request = URLRequest.exercises(queries: [])
            request = request.add(headers: ["X-Api-Key": "zPiY+pt2g2hBC1T0hZjLFQ==d0r6TIljgNNzemud"])
            let pics = await networkLayer.fetchAsync(for: request,
                                                     with: String.self)
            
            return pics
        }
        var fetchPictures: () async -> Result<PicResponse, ErrorType> = {
            let networkLayer = NetworkLayer()
            let pics = await networkLayer.fetchAsync(for: .pictures(queries: [.accessKey]),
                                                     with: PicResponse.self)
            return pics
        }
    }
    
    static let reducer: (inout State,inout Action,inout Environment) async -> () = {(state, action, environment) in
        switch action {
        case .viewDidLoad:
            let p = await environment.fetchExercises()
            let result = await environment.fetchPictures()
            switch result {
            case .success(let response):
                state.type = .picList(response)
            case .failure(let error):
                state.type = .error(error.localizedDescription)
            }
        }
    }
}

extension PicList.State {
    enum PicListStateType: Equatable {
        case loading
        case picList(PicResponse)
        case error(String)
    }
}
