//
//  CategoryAdd.View.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 19.11.23.
//

import SwiftUI
import SwiftData
import Components

struct CategoryAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @State var categoryName: String = ""
    @State var companyName: String = ""
    var body: some View {
        
        VStack {
            TextField("Category type", text: $categoryName)
            TextField("Company name", text: $companyName)
            Button("Add") {
                guard !(categoryName.isEmpty || companyName.isEmpty) else { return }
                let skinCareCategory = SkinCareCategory(name: categoryName)
                skinCareCategory.skinCares = [.init(name: companyName)]
                modelContext.insert(skinCareCategory)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        
    }
}


