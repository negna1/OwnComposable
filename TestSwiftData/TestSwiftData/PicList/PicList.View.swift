//
//  PicList.View.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 22.12.23.
//

import SwiftUI
import SwiftData
import Components

struct PicListView: View {
    public init(builder: PicList.Builder) {
        self.builder = builder
    }
    
    @ObservedObject private var builder: PicList.Builder
    @State private var isAppeared: Bool = false
    var body: some View {
        VStack {
            TwoButtonWaveAnimation()
                .frame(height: 50)
        }.onAppear(perform: {
            onAppeared()
        })
        .padding()
    }
}

// MARK: Functions
extension PicListView {
    func onAppeared() {
        if !isAppeared {
            isAppeared = true
            Task {
                await $builder.store.send(
                    newAction: .viewDidLoad)
            }
        }
    }
}

#Preview {
    PicList.build()
}


