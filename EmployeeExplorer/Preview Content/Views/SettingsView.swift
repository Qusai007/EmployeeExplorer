//
//  SettingsView.swift
//  EmployeeExplorer
//
//  Created by Qusai Johar on 2024-12-03.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        VStack(spacing: 20) {
            // Profile Image Section
            VStack {
                Image("MyProfileImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.purple, lineWidth: 3))
                    .shadow(radius: 10)
                
                Text("Qusai Johar")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("App Creator & Developer")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()
                .padding(.horizontal)
            
            // App Info Section
            VStack(alignment: .leading, spacing: 10) {
                Text("App Info")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("Name:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Qusai Johar")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Student ID:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("1217325")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Email:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("qusaijohar.11@gmail.com")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            
            Spacer()
            Spacer()
            Spacer()
            // Reset Onboarding Button
            Button(action: {
                hasSeenOnboarding = false
            }) {
                Text("Reset Onboarding")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red.opacity(0.8), Color.black]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                    .shadow(color: Color.red.opacity(0.4), radius: 6, x: 0, y: 3)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}

