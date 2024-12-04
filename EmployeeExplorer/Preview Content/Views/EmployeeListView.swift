//
//  EmployeeListView.swift
//  EmployeeExplorer
//
//  Created by Qusai Johar on 2024-12-03.
//

import SwiftUI

struct EmployeeListView: View {
    @StateObject private var viewModel = EmployeeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .padding()
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else if viewModel.employees.isEmpty {
                        Text("No employees found.")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding()
                    } else {
                        ForEach(viewModel.filteredEmployees) { employee in
                            NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                                EmployeeCardView(employee: employee)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Employees")
            .searchable(text: $viewModel.searchQuery)
            .refreshable {
                viewModel.fetchEmployees()
            }
            .onAppear {
                viewModel.fetchEmployees()
            }
        }
    }
}

struct EmployeeCardView: View {
    let employee: Employee
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: employee.photoUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            .shadow(radius: 4)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(employee.fullName)
                    .font(.headline)
                Text(employee.team)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(employee.employeeType.displayValue)
                    .font(.caption)
                    .padding(4)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    EmployeeListView()
}

