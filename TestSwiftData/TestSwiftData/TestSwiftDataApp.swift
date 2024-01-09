//
//  TestSwiftDataApp.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 15.11.23.
//

import SwiftUI
import Components
import SwiftData

//@main
//struct TestSwiftDataApp: App {
//    var body: some Scene {
//        WindowGroup {
//            CategoryList.build()
//            //ContentView()
//        }.modelContainer(for: [SkinCareCategory.self, ProfileModel.self])
//    }
//}

//@main
//struct TestSwiftDataApp: App {
//    var body: some Scene {
//        WindowGroup {
//            PicList.build()
//        }
//    }
//}
@main
struct TestSwiftDataApp: App {
    var body: some Scene {
        return WindowGroup {
            NavigationStack {
                PicList.build()
            }
        }
    }
}

