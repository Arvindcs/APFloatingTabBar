# APFloatingTabBar

A beautiful, customizable floating tab bar component for iOS applications built with SwiftUI. This library provides a modern alternative to the traditional tab bar with smooth animations, notification badges, and a centered add button.

## Features

✨ **Beautiful Design**: Modern floating design with rounded corners and shadows  
🎨 **Highly Customizable**: Extensive configuration options for colors, sizes, and animations  
🔔 **Notification Support**: Built-in notification badges for tab items  
➕ **Add Button**: Optional centered add button with custom styling  
📱 **iOS 15+ Support**: Built for modern iOS applications  
🎯 **SOLID Principles**: Clean, maintainable code architecture  
📦 **Swift Package**: Easy integration via Swift Package Manager  

## Installation

### Swift Package Manager (Recommended)

1. In Xcode, go to **File** → **Add Packages...**
2. Enter the repository URL: `https://github.com/Arvindcs/APFloatingTabBar.git`
3. Choose the version you want to install and add the package to your project.
4. Import the module where needed:
   ```swift
   import APFloatingTabBar
   ```

### Manual Installation

1. Download or clone this repository.
2. Copy the file `Sources/APFloatingTabBar/APFloatingTabBar.swift` into your project.
3. (Optional) Copy any supporting files if you want to customize or extend the component.
4. Import the module in your Swift files:
   ```swift
   import APFloatingTabBar
   ```

## Quick Start

```swift
import SwiftUI
import APFloatingTabBar

struct ContentView: View {
    @State private var selectedTab = 0
    
    private let tabs = [
        TabItem(iconName: "house.fill", title: "Home"),
        TabItem(iconName: "safari", title: "Explore", showNotification: true),
        TabItem(iconName: "chart.bar", title: "Activity"),
        TabItem(iconName: "person", title: "Profile")
    ]
    
    var body: some View {
        ZStack {
            // Your tab content here
            TabView(selection: $selectedTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ActivityView().tag(2)
                ProfileView().tag(3)
            }
            
            // Floating Tab Bar
            VStack {
                Spacer()
                APFloatingTabBar(
                    selectedTab: $selectedTab,
                    tabs: tabs,
                    onAddButtonTap: {
                        // Handle add button tap
                        print("Add button tapped!")
                    }
                )
                .padding(.bottom, 20)
            }
        }
    }
}
```

## Customization

The `APFloatingTabBar` is highly customizable through the `TabBarConfiguration`:

```swift
let customConfig = TabBarConfiguration(
    height: 70,
    cornerRadius: 35,
    backgroundColor: Color(.systemGray6),
    borderColor: Color(.systemGray4),
    borderWidth: 2,
    selectedColor: .purple,
    unselectedColor: .gray,
    iconSize: 26,
    showLabels: true,
    horizontalPadding: 20,
    addButtonColor: .purple,
    addButtonSize: 55,
    addButtonIcon: "plus.circle.fill",
    addButtonIconSize: 24
)

APFloatingTabBar(
    selectedTab: $selectedTab,
    tabs: tabs,
    configuration: customConfig,
    onAddButtonTap: { /* your action */ }
)
```

## Configuration Options

### TabBarConfiguration Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `height` | `CGFloat` | `64` | Height of the tab bar |
| `cornerRadius` | `CGFloat` | `64` | Corner radius of the tab bar |
| `backgroundColor` | `Color` | `.white` | Background color of the tab bar |
| `borderColor` | `Color` | `.gray` | Border color |
| `borderWidth` | `CGFloat` | `1` | Border width |
| `selectedColor` | `Color` | `.blue` | Color for selected tab |
| `unselectedColor` | `Color` | `.gray.opacity(0.5)` | Color for unselected tabs |
| `notificationColor` | `Color` | `.red` | Color for notification badges |
| `iconSize` | `CGFloat` | `24` | Size of tab icons |
| `labelSize` | `CGFloat` | `12` | Size of tab labels |
| `showLabels` | `Bool` | `false` | Whether to show tab labels |
| `horizontalPadding` | `CGFloat` | `16` | Horizontal padding |
| `selectionAnimation` | `Animation` | `.easeInOut` | Animation for tab selection |
| `addButtonColor` | `Color` | `.blue` | Color of the add button |
| `addButtonSize` | `CGFloat` | `50` | Size of the add button |
| `addButtonIcon` | `String` | `"plus"` | Icon for the add button |
| `addButtonIconSize` | `CGFloat` | `22` | Size of the add button icon |
| `addButtonAnimation` | `Animation` | `.easeInOut` | Animation for add button |

## TabItem Structure

```swift
struct TabItem {
    let iconName: String    // SF Symbol name
    let title: String       // Tab title
    let showNotification: Bool // Show notification badge
}
```

## Example Project

The repository includes a comprehensive example project demonstrating:

- Basic implementation
- Custom configurations
- Different tab layouts
- Add button functionality
- Notification badges

To run the example:

1. Open the project in Xcode
2. Select the example target
3. Build and run

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Architecture

The library follows SOLID principles:

- **Single Responsibility**: Each component has a single, well-defined purpose
- **Open/Closed**: Easy to extend without modifying existing code
- **Liskov Substitution**: Components can be replaced with alternatives
- **Interface Segregation**: Clean, focused interfaces
- **Dependency Inversion**: Depends on abstractions, not concretions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please:

1. Check the [Issues](https://github.com/yourusername/APFloatingTabBar/issues) page
2. Create a new issue with a detailed description
3. Include code examples and screenshots if applicable

## Acknowledgments

- Built with SwiftUI
- Inspired by modern mobile app design patterns
- Icons from SF Symbols 
