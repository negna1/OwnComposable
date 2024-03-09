//
//  SwiftUIView.swift
//  
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import SwiftUI

public struct HorizontalCarousel: View {
    public init(header: String,
                datasource: [HorizontalCarousel.URLAndTitle],
                tappedItem: Binding<HorizontalCarousel.URLAndTitle?>?,
                itemType: HorizontalCarousel.ItemType = .small) {
        self.header = header
        self.datasource = datasource
        self.itemType = itemType
        self.tappedItem = tappedItem
    }
    
    public enum ItemType {
        case large
        case small
    }
    var header: String
    var datasource: [URLAndTitle]
    var itemType: ItemType = .small
    var tappedItem: Binding<HorizontalCarousel.URLAndTitle?>?
    public var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.headline)
                .padding()
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack(spacing: itemType.spacing) {
                    ForEach(datasource) { element in
                        VStack {
                            AsyncImageView(
                                iconURL: element.url,
                                size: itemType.size,
                                cornerType: .rectangle)
                            .padding(itemType.padding)
                            Text(element.title)
                                .font(itemType.font)
                                .frame(maxWidth: 100, maxHeight: 50)
                        }
                        .onTapGesture {
                            tappedItem?.wrappedValue = element
                        }
                    }
                }
            }.padding()
        
        }
        
    }
}

#Preview {
    HorizontalCarousel.testHorizontalCarousel
}



