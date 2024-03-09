//
//  File.swift
//  
//
//  Created by Nato Egnatashvili on 01.05.23.
//

import Foundation

extension URLComponents {
    public static func pictures(queries: [URLQueryItem])-> Self {
        URLComponents(host: HostType.pixabay,
                             path: PathType.pictures,
                             queryItems: queries)
    }
    
    public static func exercises(queries: [URLQueryItem])-> Self {
        URLComponents(host: HostType.exercises,
                             path: PathType.exercises,
                             queryItems: queries)
    }
}

extension URLRequest {
    public static func pictures(queries: [URLQueryItem])-> Self {
        URLRequest(components: .pictures(queries: queries))
    }
    
    public static func exercises(queries: [URLQueryItem])-> Self {
        URLRequest(components: .exercises(queries: queries))
    }
}

extension URLQueryItem {
    public static var accessKey: Self {
        URLQueryItem(name: "key", value: APIKEY)
    }
    
    public static var exerciseAccessKey: Self {
        URLQueryItem(name: "key", value: ExercisesAPIKEY)
    }
}
