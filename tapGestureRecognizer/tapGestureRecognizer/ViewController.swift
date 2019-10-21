//
//  ViewController.swift
//  tapGestureRecognizer
//
//  Created by 김광준 on 2019/10/21.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 인터페이스 빌더를 사용
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 코드를 사용
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(_:)))

        self.view.addGestureRecognizer(tapGesture)
        
    }


}

