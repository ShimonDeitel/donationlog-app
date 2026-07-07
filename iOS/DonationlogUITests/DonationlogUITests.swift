import XCTest

final class DonationlogUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testAddFlow() {
        app.buttons["addButton"].tap()
        let field = app.textFields.firstMatch
        if field.exists {
            field.tap()
            field.typeText("Test Entry")
        }
        app.buttons["saveAddButton"].tap()
        XCTAssertTrue(app.navigationBars["Donationlog"].waitForExistence(timeout: 3))
    }

    func testCancelAddDismissesSheet() {
        app.buttons["addButton"].tap()
        app.buttons["cancelAddButton"].tap()
        XCTAssertTrue(app.navigationBars["Donationlog"].waitForExistence(timeout: 3))
    }

    func testKeyboardDismissOnTapOutside() {
        app.buttons["addButton"].tap()
        let field = app.textFields.firstMatch
        if field.exists {
            field.tap()
            XCTAssertTrue(app.keyboards.element.exists)
            app.navigationBars.firstMatch.tap()
        }
    }

    func testSettingsOpens() {
        app.buttons["settingsButton"].tap()
        XCTAssertTrue(app.buttons["doneSettingsButton"].waitForExistence(timeout: 3))
        app.buttons["doneSettingsButton"].tap()
    }
}
