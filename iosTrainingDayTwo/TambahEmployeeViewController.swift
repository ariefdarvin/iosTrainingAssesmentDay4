//
//  TambahEmployeeViewController.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import UIKit
import CoreData

class TambahEmployeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var employees = [EmployeeModel]()
    
    private let newEmployeeCell = "NewEmployeeCell"
    @IBOutlet weak var newEmployeeTableView: UITableView!
    
    var viewModel: TambahEmployeeViewModel!
    
    @IBAction func addEmployeeButton(_ sender: Any) {
        let alert = UIAlertController(title: "New Employee", message: "Fill the form below to add new employee", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {tf in
            tf.placeholder = "Id"})
        
        alert.addTextField(configurationHandler: {tf in
            tf.placeholder = "Name"})
        
        alert.addTextField(configurationHandler: {tf in
            tf.placeholder = "Salary"})
        
        alert.addAction(UIAlertAction(title: "Tambah", style: .default, handler: { action in
            if alert.textFields![0].text!.isEmpty || alert.textFields![1].text!.isEmpty {
                let warning = UIAlertController(title: "Warning", message: "Fill all the textfields", preferredStyle: .alert)
                warning.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(warning, animated: true)
            } else {
               // self.create(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, Int(alert.textFields![2].text!)!)

                self.viewModel.createNewData(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, Int(alert.textFields![2].text!)!)

                let success = UIAlertController(title: "Success", message: "Data employee added", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style:.default, handler: nil))
                self.present(success, animated: true)
                
                self.newEmployeeTableView.reloadData()
            }
        }))
        self.present(alert, animated: true)
    }
    
//    func create(_ id: Int, _ name: String, _ salary: Int){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let userEntity = NSEntityDescription.entity(forEntityName: "Employees", in: managedContext)
//        
//        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
//        insert.setValue(id, forKey: "id")
//        insert.setValue(name, forKey: "name")
//        insert.setValue(salary, forKey: "salary")
//        
//        appDelegate.saveContext()
//    }
    
//    func getEmployees() -> [EmployeeModel]{
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employees")
//        
//        do{
//            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
//            
//            employees = result.map { employee in
//                return EmployeeModel(
//                    id: employee.value(forKey: "id") as! Int,
//                    name: employee.value(forKey: "name") as! String,
//                    salary: employee.value(forKey: "salary") as! Int
//                )
//            }
//        } catch let err{
//            print(err)
//        }
//        return employees
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newEmployeeCell, for: indexPath) as! TambahEmployeeTableViewCell
        
        cell.setValue(newEmployee: self.viewModel.employeeData[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newEmployeeTableView.register(
            UINib(
                nibName: "TambahEmployeeTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier:  newEmployeeCell)
        
        newEmployeeTableView.dataSource = self
        newEmployeeTableView.delegate = self
        
        newEmployeeTableView.rowHeight = UITableView.automaticDimension
        newEmployeeTableView.estimatedRowHeight = 216
        
        viewModel = TambahEmployeeViewModel()
        viewModel.bindDataToVC = {
            self.newEmployeeTableView.reloadData()
        }
        viewModel.fetchData()
    }
    
    func editEmployee(_ id: Int, _ name: String, _ salary: Int){
        let alert = UIAlertController(title: "Edit Employee", message: "Fill the form below to edit employee", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {tf in
            tf.isEnabled = false
            tf.placeholder = "Id"
            tf.text = "\(id)"
        })
        
        alert.addTextField(configurationHandler: {tf in
            tf.placeholder = "Name"
            tf.text = name
        })
        
        alert.addTextField(configurationHandler: {tf in
            tf.placeholder = "Salary"
            tf.text = String(salary)
        })
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: {
            action in
            
            self.viewModel.editData(id, alert.textFields![1].text!, Int(alert.textFields![2].text!)!)
            
            let success = UIAlertController(title: "Success", message: "Data employee updated", preferredStyle: .alert)
            success.addAction(UIAlertAction(title: "Dismiss", style:.default, handler: nil))
            self.present(success, animated: true)
            
            self.newEmployeeTableView.reloadData()
        }))
        
        self.present(alert, animated: true)
    }
    
//    func update(_ id: Int, _ name: String, _ salary: Int){
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
//            else {return}
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Employees")
//        fetchRequest.predicate = NSPredicate(format: "id = %@", String(id))
//        
//        do{
//            let fetch = try managedContext.fetch(fetchRequest)
//            let dataToUpdate = fetch[0] as! NSManagedObject
//            
//            dataToUpdate.setValue(name, forKey: "name")
//            dataToUpdate.setValue(salary, forKey: "salary")
//            
//            try managedContext.save()
//        }catch let err{
//            print(err)
//        }
//    }
    
//    func delete(_ id: Int){
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Employees")
//        fetchRequest.predicate = NSPredicate(format: "id = %@", String(id))
//        
//        do{
//            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
//            managedContext.delete(dataToDelete)
//            
//            try managedContext.save()
//        }catch let err{
//            print(err)
//        }
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.deleteData(self.viewModel.employeeData[indexPath.row].id)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editEmployee(self.viewModel.employeeData[indexPath.row].id, self.viewModel.employeeData[indexPath.row].name, self.viewModel.employeeData[indexPath.row].salary)
    }
}
