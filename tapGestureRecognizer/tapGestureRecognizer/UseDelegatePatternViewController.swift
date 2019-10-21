//
//  UseDelegatePatternViewController.swift
//  tapGestureRecognizer
//
//  Created by 김광준 on 2019/10/21.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class UseDelegatePatternViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let textFieldExample: UITextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        
        addViews()
        textFieldConfigure()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // 이 예제에서는 return을 true나 false 아무것이나 줘도 뷰를 터치했을 때 자동으로 키보드가 내려간다
        // 그 이유는 이 메소드에서 보면 사용자가 이미 터치를 한 이후의 시점이기 때문에 어쨋든 강제로 키보드를 내리는 코드가 실행이 되기 때문이다
        
        self.view.endEditing(true)
        return true
        
    }
    
    func addViews() {
        self.view.addSubview(textFieldExample)
    }
    
    func textFieldConfigure() {
        let guide = view.safeAreaLayoutGuide
        
        let textFieldWidthValue = (view.bounds.size.width - (view.bounds.size.width - 200))
        let textFiedlHeightValue = (view.bounds.size.height - (view.bounds.size.height - 100))
        
        textFieldExample.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldExample.backgroundColor = .lightGray
        textFieldExample.placeholder = "This is TextField"
        
        let textFieldTopAnchor: NSLayoutConstraint
        textFieldTopAnchor = textFieldExample.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10)
        
        let textFieldLeadingAnchor: NSLayoutConstraint
        textFieldLeadingAnchor = textFieldExample.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 15)
        
        let textFieldTrailingAnchor: NSLayoutConstraint
        textFieldTrailingAnchor = textFieldExample.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -15)
        
        let textFieldWidth: NSLayoutConstraint
        textFieldWidth = textFieldExample.widthAnchor.constraint(equalToConstant: textFieldWidthValue)
        
        let textFieldHeight: NSLayoutConstraint
        textFieldHeight = textFieldExample.heightAnchor.constraint(equalToConstant: textFiedlHeightValue)
        
        
        textFieldTopAnchor.isActive = true
        textFieldLeadingAnchor.isActive = true
        textFieldTrailingAnchor.isActive = true
        textFieldWidth.isActive = true
        textFieldHeight.isActive = true
    }
    
    
    
}
