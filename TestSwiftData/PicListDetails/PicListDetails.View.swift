//
//  PicListDetails.View.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import SwiftUI
import Components

struct PicListDetailsView: View {
    var tappedItem: HorizontalCarousel.URLAndTitle
    var body: some View {
        Text(tappedItem.title)
        
    }
}

#Preview {
    PicListDetailsView(tappedItem: .init(title: "ef"))
}


