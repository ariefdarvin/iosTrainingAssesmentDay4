//
//  ViewController.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 13/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var nama: String = "Arief"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "masukHalamanDua" {
            let destination = segue.destination as! DetailViewController
            destination.data = nama
        }
    }
    
    @IBAction func openPageTwo(_ sender: Any) {
        // performSegue(withIdentifier: "masukHalamanDua", sender: nil)
    }
    
}

