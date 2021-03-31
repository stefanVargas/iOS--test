//
//  ErrorFlowTests.swift
//  iOS 1st mindera testTests
//
//  Created by Stefan V. de Moraes on 30/03/21.
//

import XCTest
@testable import iOS_1st_mindera_test

class ErrorFlowTests: XCTestCase {
    
    var sut: ErrorViewController!

    override func setUp()  {
        sut = ErrorViewController()
        sut.viewDidLoad()
        sut.startMainView()
        sut.setErrorTexts(title: "Test", message: "Testing Error Flow")
    }

    func testErrorMessage() throws {
        XCTAssert(sut.mainView.messageLabel.text == "Testing Error Flow", "Error Message was set")
    }
    
    func testErrorTitle() throws {
        XCTAssert(sut.mainView.titleLabel.text == "Test", "Error Title was set")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            sut.setErrorTexts(title: "Test Title", message: "Testing Error Flow with longer text as message to Display...")

        }
    }

}
