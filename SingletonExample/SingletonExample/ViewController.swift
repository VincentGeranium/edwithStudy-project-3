//
//  ViewController.swift
//  SingletonExample
//
//  Created by 김광준 on 2019/10/14.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

