//
//  NewMockDataService_Tests.swift
//  SUIProductTests
//
//  Created by iOS专用 on 2024/10/21.
//

import XCTest
@testable import SUIProduct
import Combine
final class NewMockDataService_Tests: XCTestCase {
    var cancellabel = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellabel.removeAll()
    }

    func test_NewMockDataService_init_doesSetValueCorrectly(){
        //Given
        let items: [String]? = nil
        let items2: [String]? = []
        let items3: [String]? = [UUID().uuidString, UUID().uuidString]
        //When
        let dataService = NewMockDataService(items: items)
        let dataService2 = NewMockDataService(items: items2)
        let dataService3 = NewMockDataService(items: items3)
        //Then
        XCTAssertFalse(dataService.items.isEmpty)
        XCTAssertTrue(dataService2.items.isEmpty)
        XCTAssertEqual(dataService3.items.count, items3?.count)
    }
    
    func test_NewMockDataService_downloadItemsWithEscaping_doesReturnCorrectly(){
        //Given
        let dataService = NewMockDataService(items: nil)
        //When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataService.downloadItemsWithEscaping { returnItems in
            items = returnItems
            expectation.fulfill()
        }
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(items.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_doesReturnCorrectly(){
        //Given
        let dataService = NewMockDataService(items: nil)
        //When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataService.dowmLoadItemsWithCombine()
            .sink { completion in
                switch completion{
                case.finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnItems in
                items = returnItems
                expectation.fulfill()
            }
            .store(in: &cancellabel)
        //Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(items.count, dataService.items.count)
    }
    
    func test_NewMockDataService_downloadItemsWithCombine_doesFail(){
        //Given
        let dataService = NewMockDataService(items: [])
        //When
        var items: [String] = []
        let expectation = XCTestExpectation(description: "Does throw an error")
        let expectation2 = XCTestExpectation(description: "Does throw URLError.badServiceResponse")
        
        dataService.dowmLoadItemsWithCombine()
            .sink { completion in
                switch completion{
                case.finished:
                    XCTFail()
                case .failure(let error):
                    expectation.fulfill()
                    let urlError = error as? URLError
                    XCTAssertEqual(urlError, URLError(.badServerResponse))
                    
                    if urlError == URLError(.badServerResponse){
                        expectation2.fulfill()
                    }
                }
            } receiveValue: { returnItems in
                items = returnItems
                expectation.fulfill()
            }
            .store(in: &cancellabel)
        //Then
        wait(for: [expectation, expectation2], timeout: 5)
        XCTAssertEqual(items.count, dataService.items.count)
    }
}
