//
//  EmployeeExplorerApp.swift
//  EmployeeExplorer
//
//  Created by Qusai Johar on 2024-12-03.
//

import SwiftUI

@main
struct EmployeeExplorerApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainView()
            } else {
                OnboardingView()
            }
        }
    }
}
