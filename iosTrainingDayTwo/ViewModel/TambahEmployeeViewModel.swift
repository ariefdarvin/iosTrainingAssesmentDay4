//
//  TambahEmployeeViewModel.swift
//  iosTrainingProject
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import Foundation

class TambahEmployeeViewModel: NSObject {
    private var tambahEmployeeService: TambahEmployeeService!
    private(set) var employeeData: [EmployeeModel] = [] {
        didSet {
            self.bindDataToVC()
        }
    }
    
    var bindDataToVC: () -> () = {}
    
    override init() {
        super.init()
        tambahEmployeeService = TambahEmployeeService()
    }
    
    func fetchData() {
        tambahEmployeeService.fetchNewEmployee { employees in
            self.employeeData = employees
        } onError: { error in
            print(error ?? "")
        }
    }
    
    func createNewData(_ id: Int, _ name: String, _ salary: Int){
        tambahEmployeeService.createNewEmployee(onSuccess: { self.fetchData()
        }, onError: { error in
            print(error ?? "")
        }, id, name, salary)
    }
    
    func editData(_ id: Int, _ name: String, _ salary: Int){
        tambahEmployeeService.editEmployee(onSuccess: { self.fetchData()
        }, onError: { error in
            print(error ?? "")
        }, id, name, salary)
    }
    
    func deleteData(_ id: Int){
        tambahEmployeeService.deleteEmployee(onSuccess: {self.fetchData()
        }, onError: { error in
            print(error ?? "")
        }, id)
    }
}
