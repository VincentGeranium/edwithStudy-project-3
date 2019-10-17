//
//  ViewController.swift
//  TargetActionExample
//
//  Created by 김광준 on 2019/10/17.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLable: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        // 내가 원하는 포맷 스타일로 바꾸는 코드
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        
        // 이미 정해져있는 코드
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .medium
        
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print("value chage")
        
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLable.text = dateString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: .valueChanged)
    }


}

