//
//  PicListBuilderMock.swift
//  TestSwiftDataTests
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import SwiftUI
@testable import TestSwiftData

class BuilderTest {
    static var mockPicResponse: PicResponse {
        PicResponse(total: 1, totalHits: 2, hits: [.init()])
    }
    static var customBuilder: PicList.Builder {
        PicList.Builder(state: .init(type: .loading),
                             env: .init(fetchPictures: { return Result.success(mockPicResponse)}),
                             reducer: PicList.reducer)
    }
    
    static var typeIsErrorBuilder: PicList.Builder {
        PicList.Builder(state: .init(type: .error("error")),
                             env: .init(),
                             reducer: PicList.reducer)
    }
    
    static var typeIsSuccessBuilder: PicList.Builder {
        PicList.Builder(state: .init(type: .picList(mockPicResponse)),
                                     env: .init(),
                                     reducer: PicList.reducer)
    }
}
