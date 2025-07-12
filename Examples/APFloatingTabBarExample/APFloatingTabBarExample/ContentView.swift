import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showAddSheet = false
    @State private var showCustomizationSheet = false
    
    // Sample tabs
    private let tabs = [
        TabItem(iconName: "house.fill", title: "Home"),
        TabItem(iconName: "safari", title: "Explore", showNotification: true),
        TabItem(iconName: "chart.bar", title: "Activity"),
        TabItem(iconName: "person", title: "Profile")
    ]
    
    // Custom configuration
    private let customConfig = TabBarConfiguration(
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
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                // Header
                VStack(spacing: 8) {
                    Text("APFloatingTabBar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Example Implementation")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 60)
                
                Spacer()
                
                // Tab content
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                    
                    ExploreView()
                        .tag(1)
                    
                    ActivityView()
                        .tag(2)
                    
                    ProfileView()
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer()
                
                // Floating Tab Bar
                APFloatingTabBar(
                    selectedTab: $selectedTab,
                    tabs: tabs,
                    configuration: customConfig,
                    onAddButtonTap: {
                        showAddSheet = true
                    }
                )
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddItemSheet()
        }
        .sheet(isPresented: $showCustomizationSheet) {
            CustomizationSheet()
        }
    }
}

// MARK: - Tab Views

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "house.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Home")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Welcome to the home screen!")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

struct ExploreView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "safari")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Explore")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Discover new content and features!")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

struct ActivityView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chart.bar")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("Activity")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Track your progress and achievements!")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person")
                .font(.system(size: 60))
                .foregroundColor(.purple)
            
            Text("Profile")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Manage your account and settings!")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

// MARK: - Sheets

struct AddItemSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.purple)
                
                Text("Add New Item")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("This is where you would implement your add functionality.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button("Add Sample Item") {
                    // Add your logic here
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CustomizationSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Customization Options")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("The APFloatingTabBar is highly customizable. You can modify colors, sizes, animations, and more through the TabBarConfiguration.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Available Customizations:")
                        .font(.headline)
                    
                    Text("• Height and corner radius")
                    Text("• Background and border colors")
                    Text("• Selected and unselected colors")
                    Text("• Icon and label sizes")
                    Text("• Add button appearance")
                    Text("• Animation types")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Customization")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
} 
