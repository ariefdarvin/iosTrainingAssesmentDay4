//
//  DetailViewController.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 13/10/23.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var namaLabel: UILabel!
    private let profileCell = "ProfileCell"
    @IBOutlet weak var tableViewTest: UITableView!
    var data: String = ""

    let dataProfile = Profile (
        name: "Arief",
        job: "IOS Developer",
        age: 21,
        bio: "lorem ipsum"
    )
    
    let profileTypeOrder = [
        ProfileType.name,
        ProfileType.job,
        ProfileType.age,
        ProfileType.bio
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        namaLabel.text = data
        
        tableViewTest.register(
            UINib(
                nibName: "ProfileTableViewCell", 
                bundle: nil
            ),
            forCellReuseIdentifier:  profileCell)
        
        tableViewTest.dataSource = self
        tableViewTest.delegate = self
        
        tableViewTest.rowHeight = UITableView.automaticDimension
        tableViewTest.estimatedRowHeight = 216
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as! ProfileTableViewCell
        
        let cellData: [(ProfileType, String)] = [
            (profileTypeOrder[0], dataProfile.name),
            (profileTypeOrder[1], dataProfile.job),
            (profileTypeOrder[2], String(dataProfile.age)),
            (profileTypeOrder[3], dataProfile.bio)
        ]
        
        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
        return cell
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
