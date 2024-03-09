//
//  File.swift
//  
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import SwiftUI

extension HorizontalCarousel {
    public struct URLAndTitle: Identifiable, Hashable {
        public init(id: UUID = UUID(), url: URL? = nil, title: String) {
            self.id = id
            self.url = url
            self.title = title
        }
        
        public var id: UUID = UUID()
        public let url: URL?
        public let title: String
    }
    
    static var testURLAndTitle: URLAndTitle =
        .init(url: URL(string: "https://pixabay.com/get/gb5b2b4569c8236c17e7587a522da924e563e2e5a99b53e0b55a51d007ac9fba89cbde5e5f9558f9a7547aa95222691526f91c0962225a651f06ebbfda2feaa16_1280.jpg"),
              title: "Anna Dann")
    
    
    static var testDataSource: [HorizontalCarousel.URLAndTitle] =
        [testURLAndTitle, testURLAndTitle, testURLAndTitle, testURLAndTitle]
    
    static var testHorizontalCarousel = HorizontalCarousel(header: "Featured style",
                                                           datasource: testDataSource, tappedItem: nil)
    
}

extension HorizontalCarousel.ItemType {
    private enum Constant {
        enum Large {
            static let width = 100
            static let height = 200
            static let spacing: CGFloat = 10
            static let fontWidth = 10
            static let fontName = "largeFont"
        }
        
        enum Small {
            static let width = 100
            static let height = 100
            static let spacing: CGFloat = 40
            static let fontWidth = 8
            static let fontName = "smallFont"
        }
        static let padding: CGFloat = 5
        
    }
    
    var font: Font {
        switch self {
        case .large:
                .custom(Constant.Large.fontName, size: .init(Constant.Large.fontWidth))
        case .small:
                .custom(Constant.Small.fontName, size: .init(Constant.Small.fontWidth))
        }
        
    }
    
    var size: CGSize {
        switch self {
        case .large:
                .init(width: Constant.Large.width,
                      height: Constant.Large.height)
        case .small:
                .init(width: Constant.Small.width,
                      height: Constant.Small.width)
        }
    }
    
    var padding: EdgeInsets {
        .init(top: 0,
              leading: 0,
              bottom: 0,
              trailing: Constant.padding)
    }
    
    var spacing: CGFloat {
        switch self {
        case .large:
            Constant.Large.spacing
        case .small:
            Constant.Small.spacing
        }
    }
}
