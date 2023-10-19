//
//  TambahEmployeeService.swift
//  iosTrainingProject
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import Foundation
import UIKit
import CoreData

class TambahEmployeeService: NSObject {
    var employees = [EmployeeModel]()
    func fetchNewEmployee(
        onSuccess: @escaping ([EmployeeModel]) -> Void,
        onError: @escaping (Error?) -> Void
    ){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employees")
        
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            employees = result.map { employee in
                return EmployeeModel(
                    id: employee.value(forKey: "id") as! Int,
                    name: employee.value(forKey: "name") as! String,
                    salary: employee.value(forKey: "salary") as! Int
                )
            }
            onSuccess(employees)
        } catch let err{
            onError(err)
        }
    }
    
    func createNewEmployee(
        onSuccess: @escaping () -> Void,
        onError: @escaping (Error?) -> Void,
        _ id: Int,
        _ name: String,
        _ salary: Int
    ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Employees", in: managedContext)
        
        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        insert.setValue(id, forKey: "id")
        insert.setValue(name, forKey: "name")
        insert.setValue(salary, forKey: "salary")
        
        appDelegate.saveContext()
        onSuccess()
    }
    
    func editEmployee(
        onSuccess: @escaping () -> Void,
        onError: @escaping (Error?) -> Void,
        _ id: Int,
        _ name: String,
        _ salary: Int
    ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Employees")
        fetchRequest.predicate = NSPredicate(format: "id = %@", String(id))
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
            
            dataToUpdate.setValue(name, forKey: "name")
            dataToUpdate.setValue(salary, forKey: "salary")
            
            try managedContext.save()
            onSuccess()
        }catch let err{
            onError(err)
        }
    }
    
    func deleteEmployee(
        onSuccess: @escaping () -> Void,
        onError: @escaping (Error?) -> Void,
        _ id: Int
    ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Employees")
        fetchRequest.predicate = NSPredicate(format: "id = %@", String(id))
        
        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(dataToDelete)
            
            try managedContext.save()
            onSuccess()
        }catch let err{
            onError(err)
        }
    }
}
