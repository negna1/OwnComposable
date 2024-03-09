//
//  PicListTest.swift
//  TestSwiftDataTests
//
//  Created by Nato Egnatashvili on 26.12.23.
//

import XCTest
@testable import TestSwiftData

final class PicListTest: XCTestCase {
    let picList = PicList()
    
    func testService() {
        let builder: PicList.Builder = BuilderTest.customBuilder
        XCTAssert(builder.store.state.type == .loading)
    }
    
    func testTypeIsError() {
        let builder: PicList.Builder = BuilderTest.typeIsErrorBuilder
        XCTAssert(builder.store.state.type == .error("error"))
    }
    
    func testTypeIsSuccess() {
        let builder: PicList.Builder = BuilderTest.typeIsSuccessBuilder
        XCTAssert(builder.store.state.type == .picList(.init(total: 1, totalHits: 2, hits: [.init()])))
    }
    
    func testTypeChange() {
        let builder: PicList.Builder = BuilderTest.customBuilder
        XCTAssert(builder.store.state.type == .loading)
        builder.store.state = .init(type: .error(""))
        XCTAssert(builder.store.state.type == .error(""))
    }
    
    func testEnvironment() async {
        let builder = BuilderTest.customBuilder
        await builder.store.send(.viewDidLoad)
        
        let expectation = XCTestExpectation(description: "lol")
        switch builder.store.state.type {
        case .loading:
            XCTAssert(false, "There should not be loading, should be list")
        case .picList(let list):
            XCTAssert(list.hits?.count == 1, "count is incorrect")
        case .error(_):
            XCTAssert(false, "There should not be error, should be list")
        }
        expectation.fulfill()
        await fulfillment(of: [expectation])
        
    }
}

