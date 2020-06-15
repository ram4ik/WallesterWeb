//
//  WallesterWebUITests.swift
//  WallesterWebUITests
//
//  Created by Ramill Ibragimov on 15.06.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import XCTest

class WallesterWebUITests: XCTestCase {

    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    override func setUp() {
        safari.launch()
    }
    
    override func tearDown() {
        safari.terminate()
    }
    
    func testWallesterWeb() throws {
        
        let app = XCUIApplication()
        
        _ = safari.wait(for: .runningForeground, timeout: 30)
        
        safari.buttons["URL"].tap()
        
        safari.typeText("https://wallester.eu")
        safari.keyboards.buttons["Go"].tap()
        
        _ = app.wait(for: .runningForeground, timeout: 5)
        print(safari.debugDescription)
        
        for _ in 1...11 {
            safari.webViews["WebView"].swipeUp()
        }

        for _ in 1...11 {
            safari.webViews["WebView"].swipeDown()
        }
        
        XCTAssert(safari.webViews["WebView"].staticTexts["CONTACT EXPERTS"].exists)
        _ = app.wait(for: .runningForeground, timeout: 5)
    }
}
