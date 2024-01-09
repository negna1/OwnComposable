//
//  CategoryList.View.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 16.11.23.
//

import SwiftUI
import SwiftData
import Components

struct CategoryListView: View {
    @ObservedObject var builder: CategoryList.Builder
    @State var loading: Bool = true
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \SkinCareCategory.name) private var categories: [SkinCareCategory]
    @Query(sort: \ProfileModel.username) private var profiles: [ProfileModel]
    var body: some View {
        
        VStack {
            switch builder.store.state.type {
            case .loading:
                ActivityIndicatorView(isVisible: $loading,
                                      type: .rotatingDots(count: 10))
                    .frame(width: 100, height: 100)
            case .categoryList(let list):
                ForEach(categories, id: \.self) {category in
                    VStack {
                        
                        Text("\(category.name)")
                        ForEach(category.skinCares, id: \.self) {
                            Text("\($0.name)")
                        }
                        Text("------")
                    }
                }
                ProfileCardView(title: "Good Morning", bodyString: "Nato Egnatashvili",
                                iconURL: URL.init(string: "https://techcrunch.com/wp-content/uploads/2022/12/lensa-ai-magic-avatar.jpg"))
                Button("Add New Category") {
                    Task {
                        await $builder.store.send(newAction: .navigateDetails)
                    }
                }
            }
        }.onAppear(perform: {
            Task {
                await $builder.store.send(newAction: .viewDidLoad)
                if profiles.first == nil {
                    await $builder.store.send(newAction: .navigateSetUp)
                }
            }
           
        })
        .padding()
            .navigationDestination(
                isPresented: $builder.store.state.presentCreateNewCategory,
                destination: {CategoryAddView()})
            .navigationDestination(
                isPresented: $builder.store.state.presentSetUp ,
                destination: {SetUpView()})
        
    }
}

#Preview {
    CategoryList.build()
        .modelContainer(for: SkinCareCategory.self)
}

