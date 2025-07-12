import SwiftUI
import APFloatingTabBar

/// Example showing how to integrate APFloatingTabBar with existing TabView code
struct UsageExample: View {
    @State private var selectedTab = 0
    @State private var isNavigating = false
    
    // Define your tabs
    private let tabs = [
        TabItem(iconName: "house.fill", title: "Home"),
        TabItem(iconName: "safari", title: "Challenges", showNotification: true),
        TabItem(iconName: "chart.bar", title: "Activity"),
        TabItem(iconName: "person", title: "Profile")
    ]
    
    // Custom configuration to match your design
    private let customConfig = TabBarConfiguration(
        height: 70,
        cornerRadius: 35,
        backgroundColor: Color(.systemBackground),
        borderColor: Color(.systemGray4),
        borderWidth: 1,
        selectedColor: .blue,
        unselectedColor: .gray,
        iconSize: 24,
        showLabels: false,
        horizontalPadding: 16,
        addButtonColor: .blue,
        addButtonSize: 50,
        addButtonIcon: "plus",
        addButtonIconSize: 22
    )
    
    var body: some View {
        ZStack {
            // Your existing TabView
            TabView(selection: $selectedTab) {
                NavigationStack {
                    HomeDashboardView(isNavigating: $isNavigating)
                        .tag(0)
                        .onAppear { isNavigating = false }
                }
                
                NavigationStack {
                    ChallengesView()
                }
                .tag(1)
                
                ActivityView()
                    .tag(2)
                
                ProfileView()
                    .tag(3)
            }
            .ignoresSafeArea(.keyboard)
            
            // Floating Tab Bar overlay
            VStack {
                Spacer()
                APFloatingTabBar(
                    selectedTab: $selectedTab,
                    tabs: tabs,
                    configuration: customConfig,
                    onAddButtonTap: {
                        // Handle your add button action
                        print("Add button tapped!")
                        // You can show a sheet, present a modal, etc.
                    }
                )
                .padding(.bottom, 20)
            }
        }
    }
}

// MARK: - Placeholder Views (replace with your actual views)

struct HomeDashboardView: View {
    @Binding var isNavigating: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your home content goes here")
                .font(.body)
                .foregroundColor(.secondary)
            
            Button("Navigate") {
                isNavigating = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ChallengesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Challenges")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your challenges content goes here")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ActivityView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Activity")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your activity content goes here")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your profile content goes here")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    UsageExample()
} 