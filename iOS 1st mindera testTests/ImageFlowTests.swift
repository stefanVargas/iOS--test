//
//  ImageFlowTests.swift
//  iOS 1st mindera testTests
//
//  Created by Stefan V. de Moraes on 31/03/21.
//

import XCTest
@testable import iOS_1st_mindera_test

class ImageFlowTests: XCTestCase {

    var sut: ImageViewController!

    override func setUp() {
        sut = ImageViewController()
        sut.viewDidLoad()
    }

    func testImage() throws {
        sut.setImage(fromURL: String())
        
        XCTAssertTrue(sut.mainView.imageView.image == UIImage(named: StringConstants.kPlaceHoderName), "Image is equal placeholder image")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
