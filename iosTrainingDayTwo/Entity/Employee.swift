//
//  Employee.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 18/10/23.
//

import Foundation

struct EmployeeData: Codable {
    let status: String
    let data: [EmployeeValue]
    let message: String
}

struct EmployeeValue: Codable {
    let name: String
    let age, salary: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "employee_name"
        case age = "employee_age"
        case salary = "employee_salary"
    }
}

struct EmployeeModel {
    let id: Int
    let name: String
    let salary: Int
}

    

