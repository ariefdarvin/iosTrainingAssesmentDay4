//
//  EmployeeTableViewCell.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 18/10/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeAge: UILabel!
    @IBOutlet weak var employeeSalary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setValue(employee: EmployeeValue){
        employeeName.text = ": "+employee.name
        employeeAge.text = ": "+String(employee.age)
        employeeSalary.text = ": Rp. "+String(employee.salary)
    }
}
