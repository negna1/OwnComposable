//
//  File.swift
//  
//
//  Created by Nato Egnatashvili on 05.05.23.
//

import Foundation

public enum HostType: String {
    case pixabay = "pixabay.com"
    case example = "api.github.com"
    case exercises = "api.api-ninjas.com"
}

public enum PathType: String {
    case pictures = "/api/"
    case exercises = "/v1/exercises/"
}

public var APIKEY = "40568665-2374fc71c0582a8c3d045dca1"
public var ExercisesAPIKEY = "zPiY+pt2g2hBC1T0hZjLFQ==d0r6TIljgNNzemud"

extension HostType: HostTypable {
    public var host: String {
        self.rawValue
    }
}

extension PathType: PathTypable {
    public var path: String {
        self.rawValue
    }
}
