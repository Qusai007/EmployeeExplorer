//
//  MainView.swift
//  EmployeeExplorer
//
//  Created by Qusai Johar on 2024-12-03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            EmployeeListView()
                .tabItem {
                    Label("Employees", systemImage: "person.3")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
