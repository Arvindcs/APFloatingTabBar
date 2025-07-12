import XCTest
import SwiftUI
@testable import APFloatingTabBar

final class APFloatingTabBarTests: XCTestCase {
    
    func testTabItemInitialization() {
        let tabItem = TabItem(
            iconName: "house.fill",
            title: "Home",
            showNotification: true
        )
        
        XCTAssertEqual(tabItem.iconName, "house.fill")
        XCTAssertEqual(tabItem.title, "Home")
        XCTAssertTrue(tabItem.showNotification)
    }
    
    func testTabBarConfigurationDefaultValues() {
        let config = TabBarConfiguration()
        
        XCTAssertEqual(config.height, 64)
        XCTAssertEqual(config.cornerRadius, 64)
        XCTAssertEqual(config.backgroundColor, .white)
        XCTAssertEqual(config.selectedColor, .blue)
        XCTAssertEqual(config.addButtonSize, 50)
        XCTAssertEqual(config.addButtonIcon, "plus")
    }
    
    func testTabBarConfigurationCustomValues() {
        let config = TabBarConfiguration(
            height: 80,
            cornerRadius: 40,
            backgroundColor: .black,
            selectedColor: .red,
            addButtonColor: .green,
            addButtonSize: 60,
            addButtonIcon: "star"
        )
        
        XCTAssertEqual(config.height, 80)
        XCTAssertEqual(config.cornerRadius, 40)
        XCTAssertEqual(config.backgroundColor, .black)
        XCTAssertEqual(config.selectedColor, .red)
        XCTAssertEqual(config.addButtonColor, .green)
        XCTAssertEqual(config.addButtonSize, 60)
        XCTAssertEqual(config.addButtonIcon, "star")
    }
    
    func testAPFloatingTabBarInitialization() {
        let tabs = [
            TabItem(iconName: "house.fill", title: "Home"),
            TabItem(iconName: "person", title: "Profile")
        ]
        
        let config = TabBarConfiguration()
        
        // This test ensures the initializer works without crashing
        let _ = APFloatingTabBar(
            selectedTab: .constant(0),
            tabs: tabs,
            configuration: config
        )
        
        // Test with add button
        let _ = APFloatingTabBar(
            selectedTab: .constant(0),
            tabs: tabs,
            configuration: config,
            onAddButtonTap: {}
        )
    }
} 