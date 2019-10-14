//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by 김광준 on 2019/10/14.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInformation.shared.name
        self.ageLabel.text = UserInformation.shared.age
    }
    
    @IBAction func didTappedPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
