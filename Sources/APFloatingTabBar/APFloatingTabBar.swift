import SwiftUI

/// A customizable floating tab bar component for iOS applications
public struct APFloatingTabBar: View {
    @Binding private var selectedTab: Int
    private let tabs: [TabItem]
    private let configuration: TabBarConfiguration
    private let onAddButtonTap: (() -> Void)?
    
    public init(
        selectedTab: Binding<Int>,
        tabs: [TabItem],
        configuration: TabBarConfiguration = TabBarConfiguration(),
        onAddButtonTap: (() -> Void)? = nil
    ) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.configuration = configuration
        self.onAddButtonTap = onAddButtonTap
    }
    
    public var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: configuration.cornerRadius)
                .fill(configuration.backgroundColor)
                .frame(height: configuration.height)
                .overlay(
                    RoundedRectangle(cornerRadius: configuration.cornerRadius)
                        .stroke(configuration.borderColor, lineWidth: configuration.borderWidth)
                )

            // Tab bar content with centered add button
            HStack(alignment: .center, spacing: 0) {
                let midIndex = tabs.count / 2
                let leftTabs = tabs.prefix(midIndex)
                let rightTabs = tabs.suffix(tabs.count - midIndex)

                ForEach(Array(leftTabs.enumerated()), id: \ .offset) { index, tab in
                    TabBarButton(
                        tab: tab,
                        isSelected: selectedTab == index,
                        configuration: configuration
                    ) {
                        withAnimation(configuration.selectionAnimation) {
                            selectedTab = index
                        }
                    }
                }

                // Center add button spacer
                if onAddButtonTap != nil {
                    Spacer(minLength: 0)
                        .frame(width: configuration.addButtonSize)
                }

                ForEach(Array(rightTabs.enumerated()), id: \ .offset) { index, tab in
                    let actualIndex = midIndex + index
                    TabBarButton(
                        tab: tab,
                        isSelected: selectedTab == actualIndex,
                        configuration: configuration
                    ) {
                        withAnimation(configuration.selectionAnimation) {
                            selectedTab = actualIndex
                        }
                    }
                }
            }
            .padding(.horizontal, configuration.horizontalPadding)
            .frame(height: configuration.height)

            // Add button overlay (centered)
            if let onAddButtonTap = onAddButtonTap {
                HStack {
                    Spacer()
                    AddButton(
                        configuration: configuration,
                        action: onAddButtonTap
                    )
                    .offset(y: -configuration.addButtonSize / 3)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Supporting Views

private struct TabBarButton: View {
    let tab: TabItem
    let isSelected: Bool
    let configuration: TabBarConfiguration
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                VStack(spacing: 4) {
                    Image(systemName: tab.iconName)
                        .font(.system(size: configuration.iconSize))
                        .foregroundColor(isSelected ? configuration.selectedColor : configuration.unselectedColor)
                    
                    if configuration.showLabels {
                        Text(tab.title)
                            .font(.system(size: configuration.labelSize, weight: .medium))
                            .foregroundColor(isSelected ? configuration.selectedColor : configuration.unselectedColor)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                
                if tab.showNotification {
                    Circle()
                        .fill(configuration.notificationColor)
                        .frame(width: 8, height: 8)
                        .offset(x: 8, y: -16)
                }
            }
        }
    }
}

private struct AddButton: View {
    let configuration: TabBarConfiguration
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation(configuration.addButtonAnimation) {
                action()
            }
        }) {
            ZStack {
                Circle()
                    .fill(configuration.addButtonColor)
                    .frame(width: configuration.addButtonSize, height: configuration.addButtonSize)
                    .shadow(
                        color: configuration.addButtonColor.opacity(0.3),
                        radius: 8,
                        x: 0,
                        y: 4
                    )
                
                Image(systemName: configuration.addButtonIcon)
                    .font(.system(size: configuration.addButtonIconSize, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Data Models

/// Represents a single tab item in the floating tab bar
public struct TabItem {
    public let iconName: String
    public let title: String
    public let showNotification: Bool
    
    public init(
        iconName: String,
        title: String,
        showNotification: Bool = false
    ) {
        self.iconName = iconName
        self.title = title
        self.showNotification = showNotification
    }
}

/// Configuration options for the floating tab bar
public struct TabBarConfiguration {
    public let height: CGFloat
    public let cornerRadius: CGFloat
    public let backgroundColor: Color
    public let borderColor: Color
    public let borderWidth: CGFloat
    public let selectedColor: Color
    public let unselectedColor: Color
    public let notificationColor: Color
    public let iconSize: CGFloat
    public let labelSize: CGFloat
    public let showLabels: Bool
    public let horizontalPadding: CGFloat
    public let selectionAnimation: Animation
    public let addButtonColor: Color
    public let addButtonSize: CGFloat
    public let addButtonIcon: String
    public let addButtonIconSize: CGFloat
    public let addButtonAnimation: Animation
    
    public init(
        height: CGFloat = 64,
        cornerRadius: CGFloat = 64,
        backgroundColor: Color = .white,
        borderColor: Color = .gray,
        borderWidth: CGFloat = 1,
        selectedColor: Color = .blue,
        unselectedColor: Color = .gray.opacity(0.5),
        notificationColor: Color = .red,
        iconSize: CGFloat = 24,
        labelSize: CGFloat = 12,
        showLabels: Bool = false,
        horizontalPadding: CGFloat = 16,
        selectionAnimation: Animation = .easeInOut,
        addButtonColor: Color = .blue,
        addButtonSize: CGFloat = 50,
        addButtonIcon: String = "plus",
        addButtonIconSize: CGFloat = 22,
        addButtonAnimation: Animation = .easeInOut
    ) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.notificationColor = notificationColor
        self.iconSize = iconSize
        self.labelSize = labelSize
        self.showLabels = showLabels
        self.horizontalPadding = horizontalPadding
        self.selectionAnimation = selectionAnimation
        self.addButtonColor = addButtonColor
        self.addButtonSize = addButtonSize
        self.addButtonIcon = addButtonIcon
        self.addButtonIconSize = addButtonIconSize
        self.addButtonAnimation = addButtonAnimation
    }
}

// MARK: - Preview

#Preview {
    APFloatingTabBar(
        selectedTab: .constant(0),
        tabs: [
            TabItem(iconName: "house.fill", title: "Home"),
            TabItem(iconName: "safari", title: "Explore", showNotification: true),
            TabItem(iconName: "chart.bar", title: "Activity"),
            TabItem(iconName: "person", title: "Profile")
        ],
        onAddButtonTap: {
            print("Add button tapped")
        }
    )
    .padding()
} 
