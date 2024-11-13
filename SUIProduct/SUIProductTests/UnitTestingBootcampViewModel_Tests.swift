//
//  UnitTestingBootcampViewModel_Tests.swift
//  SUIProductTests
//
//  Created by iOS专用 on 2024/10/18.
//

import XCTest
@testable import SUIProduct
import Combine
// Nameing Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Nameing Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing Structure: Given, When, Then
final class UnitTestingBootcampViewModel_Tests: XCTestCase {

    var viewModel: UnitTestingBootcampViewModel?
    var cancellable = Set<AnyCancellable>()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootcampViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func test_UnitTestingBootcampView_isPremium_shouldBeTrue(){
        //Given
        let userIsPremium: Bool = true
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        //Then
        XCTAssertTrue(vm.isPremium)
    }
    func test_UnitTestingBootcampView_isPremium_shouldBeFalse(){
        //Given
        let userIsPremium: Bool = false
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        //Then
        XCTAssertFalse(vm.isPremium)
    }
    func test_UnitTestingBootcampView_isPremium_shouldBeInjectedValue(){
        //Given
        let userIsPremium: Bool = Bool.random()
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        //Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    func test_UnitTestingBootcampView_isPremium_shouldBeInjectedValue_stress(){
        for _ in 0..<10{
            //Given
            let userIsPremium: Bool = Bool.random()
            //When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            //Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty(){
        //Given
 
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldAddItems(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 0..<100)
        for _ in 0..<loopCount{
            vm.addItem(item: UUID().uuidString)
        }
        //Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        //XCTAssertGreaterThanOrEqual
        //XCTAssertLessThanOrEqual
        //XCTAssertLessThanOrEqual
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        vm.addItem(item: "")
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString2(){
        //Given
        guard let vm = viewModel else{
            XCTFail()
            return
        }
        //When
        vm.addItem(item: "")
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    func test_UnitTestingBootcampViewModel_selectedItem_shouldStartAsNil(){
        //Given

        //When
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //Then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        //select valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        //select invalid item
        vm.selectItem(item: UUID().uuidString)
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemArray: [String] = []
        for _ in 0..<loopCount{
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemArray.append(newItem)
        }
        let randomItem = itemArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        //Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
        
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_itemNotFound(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount{
            vm.addItem(item: UUID().uuidString)
        }
        //Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not Found error!"){ error in
            let returnError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnError, UnitTestingBootcampViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount{
            vm.addItem(item: UUID().uuidString)
        }
        //Then
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnError, UnitTestingBootcampViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldSaveItem(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemArray: [String] = []
        for _ in 0..<loopCount{
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemArray.append(newItem)
        }
        let randomItem = itemArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        //Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
        
    }
    //异步测试
    func test_UnitTestingBootcampViewModel_downloadWithEscaping_shouldReturnItems(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let expection = XCTestExpectation(description: "Should retur items after 3 seconds.")
        vm.$dataArray
            .dropFirst()
            .sink { returnItems in
                expection.fulfill()
            }
            .store(in: &cancellable)
        vm.downloadWithEscaping()
        //Then
        wait(for: [expection], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombine_shouldReturnItems(){
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        //When
        let expection = XCTestExpectation(description: "Should retur items after a seconds.")
        vm.$dataArray
            .dropFirst()
            .sink { returnItems in
                expection.fulfill()
            }
            .store(in: &cancellable)
        vm.downloadWithCombine()
        //Then
        wait(for: [expection], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
    }
    
    func test_UnitTestingBootcampViewModel_downloadWithCombine_shouldReturnItems2(){
        //Given
        let items = [UUID().uuidString,UUID().uuidString,UUID().uuidString,UUID().uuidString,UUID().uuidString]
        let dataService: NewDataServiceProtocol = NewMockDataService(items: items)
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random(), dataService: dataService)
        //When
        let expection = XCTestExpectation(description: "Should retur items after a seconds.")
        vm.$dataArray
            .dropFirst()
            .sink { returnItems in
                expection.fulfill()
            }
            .store(in: &cancellable)
        vm.downloadWithCombine()
        //Then
        wait(for: [expection], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        XCTAssertEqual(vm.dataArray.count, items.count)
    }
}
