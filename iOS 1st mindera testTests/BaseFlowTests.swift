//
//  BaseFlowTests.swift
//  iOS 1st mindera testTests
//
//  Created by Stefan V. de Moraes on 30/03/21.
//

import XCTest
@testable import iOS_1st_mindera_test

class BaseFlowTests: XCTestCase {
    
    var sut: MyBaseViewController!

    override func setUp() {
        sut = MyBaseViewController()
        sut.viewDidLoad()
        sut.modelRequest()

    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelInitialState() throws {
        XCTAssertTrue(sut.viewModel.contentState == .none, "The state starts none")
    }

    func testMainView() throws {
        sut.startMainView()
        var hasMainView = false
        for view in sut.view.subviews {
            if view.isKind(of: BaseMainView.self) {
                hasMainView = true
            }
        }
        
        XCTAssertTrue(hasMainView, "View Controller has Main View.")
    }
    
    func testPhotosCollection() throws {
        let photo = FlickrPhoto(farm: 000, id: String(), owner: String(),
                                secret: String(), server: String(),
                                title: "test", isFamily: 1,
                                isFriend: 1, isPublic: 1)
        
        sut.viewModel.add(photos: [photo])
        let photos = sut.viewModel.photos

        XCTAssert(photos.count == 1, "It got one photo")
    }

    func testPerformanceExample() throws {
        self.measure {
            sut.searchRequest(tag: "test")
        }
    }

}
