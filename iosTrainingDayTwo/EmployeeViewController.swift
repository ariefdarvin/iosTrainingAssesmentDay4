//
//  EmployeeViewController.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 18/10/23.
//

import UIKit
import Alamofire

class EmployeeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let employeeCell = "EmployeeCell"
    @IBOutlet weak var employeeTableView: UITableView!
    var employees: [EmployeeValue] = []
    var viewModel: EmployeeViewModel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: employeeCell, for: indexPath) as! EmployeeTableViewCell
        
//        let cellData = employees
        
        cell.setValue(employee: self.viewModel.employeeData[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        employeeTableView.register(
            UINib(
                nibName: "EmployeeTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier:  employeeCell)
        
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        
        employeeTableView.rowHeight = UITableView.automaticDimension
        employeeTableView.estimatedRowHeight = 216
        // Do any additional setup after loading the view.
        
//        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return }
//        let urlConvertible: URLConvertible = url;
//        
//        AF.request(urlConvertible).response{response in
//            do{
//                let result = try JSONDecoder().decode(EmployeeData.self, from: response.data!)
//                DispatchQueue.main.async{ [weak self] in
//                    self?.employees = result.data
//                    self?.employeeTableView.reloadData()
//                }
//            }catch let jsonErr{
//                print("ERROR", jsonErr)
//            }
//        }
        
        viewModel = EmployeeViewModel()
        viewModel.bindDataToVC = {
            self.employeeTableView.reloadData()
        }
        viewModel.fetchData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
