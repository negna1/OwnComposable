//
//  PicList.HelperViews.swift
//  TestSwiftData
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import SwiftUI
import Components

// MARK: - Loading
extension PicListView {
    struct LoadingView: View {
        private enum Constant {
            static let dotCount = 10
            static let width: CGFloat = 100
            static let height: CGFloat = 100
        }
        @State var loading: Bool = true
        var body: some View {
            ActivityIndicatorView(isVisible: $loading,
                                  type: .rotatingDots(count: Constant.dotCount))
            .frame(width: Constant.width,
                   height: Constant.height)
        }
    }
}

// MARK: - Results
extension PicListView {
    struct HorizontalPictureView: View {
        var list: PicResponse
        @State var tappedItem: HorizontalCarousel.URLAndTitle?
        var body: some View {
            ScrollView {
                VStack {
                    HorizontalCarousel(
                        header: "Featured",
                        datasource: list.horizontalPictureDataSource, tappedItem: $tappedItem ,
                        itemType: .large)
                    HorizontalCarousel(
                        header: "Users",
                        datasource: list.horizontalUsersDataSource, tappedItem: $tappedItem,
                        itemType: .small)
                }
            }
            .navigationDestination(item: $tappedItem) { detail in
                PicListDetailsView(tappedItem: detail)
            }
        }
    }

}
