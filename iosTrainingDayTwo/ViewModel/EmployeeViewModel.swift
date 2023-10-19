//
//  EmployeeViewModel.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import Foundation

class EmployeeViewModel: NSObject {
    private var apiService: ApiServices!
    private(set) var employeeData: [EmployeeValue] = [] {
        didSet {
            self.bindDataToVC()
        }
    }
    
    var bindDataToVC: () -> () = {}
    
    override init() {
        super.init()
        apiService = ApiServices()
    }
    
    func fetchData() {
        apiService.fetchEmployees { employees in
            self.employeeData = employees
        } onError: { error in
            print(error ?? "")
        }
    }
}
