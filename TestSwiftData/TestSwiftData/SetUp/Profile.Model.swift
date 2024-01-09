//
//  Profile.Model.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 20.11.23.
//

import SwiftData

@Model
final class ProfileModel {
    public init(username: String, 
                name: String,
                lastName: String,
                picUrl: String? = nil) {
        self.username = username
        self.name = name
        self.lastName = lastName
        self.picUrl = picUrl
    }
    
    @Attribute(.unique) var username: String
    var name: String
    var lastName: String
    var picUrl: String?
    
}
