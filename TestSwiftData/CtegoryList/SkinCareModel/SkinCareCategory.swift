//
//  SkinCareCategory.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 18.11.23.
//

import Foundation
import SwiftData


@Model
final class SkinCareCategory {
    @Attribute(.unique) var name: String
    // `.cascade` tells SwiftData to delete all skinCares contained in the
    // category when deleting it.
    @Relationship(deleteRule: .cascade, inverse: \SkinCare.category)
    var skinCares = [SkinCare]()
    
    init(name: String) {
        self.name = name
    }
}

