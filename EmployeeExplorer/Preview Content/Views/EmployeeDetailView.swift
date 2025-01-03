//
//  EmployeeDetailView.swift
//  EmployeeExplorer
//
//  Created by Qusai Johar on 2024-12-03.
//

import SwiftUI

struct EmployeeDetailView: View {
    let employee: Employee
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                AsyncImage(url: URL(string: employee.photoUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                }
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .shadow(radius: 8)
                
                Text(employee.fullName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(employee.biography)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Text(employee.employeeType.displayValue)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                    
                    Text(employee.team)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Contact Information")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                        Text(employee.phoneNumber)
                    }
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text(employee.emailAddress)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Employee Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EmployeeDetailView(employee: Employee(
        id: "1",
        fullName: "John Doe",
        phoneNumber: "123-456-7890",
        emailAddress: "john.doe@example.com",
        biography: "A software engineer with a passion for mobile development.",
        photoUrl: "https://example.com/photo.jpg",
        team: "Core Team",
        employeeType: .fullTime
    ))
}


