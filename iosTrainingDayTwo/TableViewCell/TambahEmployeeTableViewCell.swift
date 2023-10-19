//
//  TambahEmployeeTableViewCell.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import UIKit

class TambahEmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(newEmployee: EmployeeModel){
        idLabel.text = String(newEmployee.id)+" , "
        nameLabel.text = newEmployee.name
        salaryLabel.text = "Rp. "+String(newEmployee.salary)
    }
}
