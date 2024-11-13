//
//  UITestingBootcampView_UITests.swift
//  SUIProductUITests
//
//  Created by iOS专用 on 2024/10/22.
//

import XCTest
// Nameing Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Nameing Structure: test_[struct]_[ui_component]_[expected result]
// Testing Structure: Given, When, Then
final class UITestingBootcampView_UITests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["-UITest_startSignedIn"]
        app.launch()
    }
    override func tearDownWithError() throws {

    }
    func test_UITestingBootcampView_signUpButton_shouledNotSignIn(){
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: false)
        //When
        let navBar = app.navigationBars["Welcome"]
        //Then
        
        XCTAssertFalse(navBar.exists)
    }
    func test_UITestingBootcampView_signUpButton_shouledSignIn(){
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: true)
        //When
        let navBar = app.navigationBars["Welcome"]
        //Then
        
        XCTAssertTrue(navBar.exists)
    }
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert(){
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: true)
        //When
        tapAlertButton(shouldDismissAlert: false)
        
        //Then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)

    }
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert(){
        
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: true)
        //When
        tapAlertButton(shouldDismissAlert: true)
        
        let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
        //Then
        XCTAssertFalse(alertExists)
    }
    
    func test_SignedInHomeView_NavigationLinkToDestination_shouldNavigationToDestination(){
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: true)
        //When
        tapNavigationLink(shouldDismissDestination: false)
        //Then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
        
    }
    func test_SignedInHomeView_NavigationLinkToDestination_shouldNavigationToDestinationAndGoBack(){
        
        //Given
        signUpAndSignIn(shouldTypeOnKeyboarding: true)
        //When
        tapNavigationLink(shouldDismissDestination: true)
        
        //Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
    }
    func test_SignedInHomeView_NavigationLinkToDestination_shouldNavigationToDestinationAndGoBack2(){
        
        //Given
        
        //When
        tapNavigationLink(shouldDismissDestination: true)
        
        //Then
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
        
    }
}
//MARK: FUNCTIONS
extension UITestingBootcampView_UITests{
    func signUpAndSignIn(shouldTypeOnKeyboarding: Bool){
        let textField = app.textFields["SignUpTextField"]
        textField.tap()
        if shouldTypeOnKeyboarding{
            let keyA = app.keys["A"]
            keyA.tap()
            let keya = app.keys["a"]
            keya.tap()
            keya.tap()
        }
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"]",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let signUpButton = app.buttons["SignUpButton"]
        signUpButton.tap()
    }
    func tapAlertButton(shouldDismissAlert: Bool){
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert{
            let alert = app.alerts.firstMatch
            let alertOKButton = alert.buttons["OK"]
            let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOKButtonExists)
            alertOKButton.tap()
        }
    }
    func tapNavigationLink(shouldDismissDestination: Bool){
        let navLinkButton = app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        if shouldDismissDestination{
            let backButton = app.navigationBars.buttons["Welcome"]
            backButton.tap()
        }
    }
}
