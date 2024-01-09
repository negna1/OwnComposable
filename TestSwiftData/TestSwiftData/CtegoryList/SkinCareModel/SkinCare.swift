//
//  SkinCare.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 18.11.23.
//

import Foundation
import SwiftData

@Model
final class SkinCare {
    var name: String
    var category: SkinCareCategory?
    
    init(name: String) {
        self.name = name
    }
}
