//
//  TestingCITests.swift
//  TestingCITests
//
//  Created by Mykhaylo Levchuk on 07/01/2022.
//

import XCTest
@testable import TestingCI

class TestingCITests: XCTestCase {

    func test_sut_ifNetworkRequestFailed_errorShouldBeEmitted() {
        let sut = makeSUT()
        let expectation = expectation(description: "Waiting for failure")
        
        sut.result = .failure(.mockError)
        var results: [APIError] = []
        
        sut.performRequest { result in
            switch result {
            case .failure(let error):
                results.append(error)
                expectation.fulfill()
            case .success:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 1.0)
        
        XCTAssertEqual(results.count, 1)
    }
    
    func makeSUT() -> APIClient {
        .init()
    }

}
