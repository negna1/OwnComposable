//
//  SetUpView.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 20.11.23.
//

import SwiftUI
import Components

struct SetUpView: View {
    @State var username: String = ""
    @State var name: String = ""
    @State var lastName: String = ""
    @State var picURL: String = ""
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Set Up Profile")
            TextField("Username",
                      text: $username)
            .generalTextFieldModifier
            TextField("Name",
                      text: $name)
            .generalTextFieldModifier
            TextField("Last name",
                      text: $lastName)
            .generalTextFieldModifier
            TextField("Pic URL",
                      text: $picURL)
            .generalTextFieldModifier
            Button("Save") {
                guard !(username.isEmpty && name.isEmpty &&
                      lastName.isEmpty) else { return }
                let profile = ProfileModel(username: username, name: name, lastName: lastName, picUrl: picURL.isEmpty ? nil : picURL)
                modelContext.insert(profile)
                presentationMode.wrappedValue.dismiss()
            }.tint(.gray)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SetUpView()
}
