//
//  ThirdViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/11/06.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - phoneNumTitle()
    /// 전화번호 레이블
    lazy var phoneNumTitle: UILabel = {
        let phoneNumTitle: UILabel = UILabel()
        phoneNumTitle.text = "전화번호"
        phoneNumTitle.textAlignment = NSTextAlignment.left
        phoneNumTitle.textColor = UIColor.black
        phoneNumTitle.font = UIFont.systemFont(ofSize: 20)
        
        return phoneNumTitle
    }()
    
    lazy var phoneNumTxtField: UITextField = {
        let phoneNumTxtField: UITextField = UITextField()
        phoneNumTxtField.borderStyle = .roundedRect
        
        
        return phoneNumTxtField
    }()
    
    lazy var dateOfBirthTitle: UILabel = {
        let dateOfBirthTitle: UILabel = UILabel()
        dateOfBirthTitle.text = "생년월일"
        dateOfBirthTitle.textAlignment = .left
        dateOfBirthTitle.textColor = .black
        dateOfBirthTitle.font = .systemFont(ofSize: 20)
        
        return dateOfBirthTitle
    }()
    
    lazy var dateOfBirthDisplay: UILabel = {
        let dateOfBirthDisplay: UILabel = UILabel()
        dateOfBirthDisplay.text = "April 24, 1991"
        dateOfBirthDisplay.textAlignment = .left
        dateOfBirthDisplay.textColor = .black
        dateOfBirthDisplay.font = .systemFont(ofSize: 20)
        
        return dateOfBirthDisplay
    }()
    
    
    
    lazy var mainDatePicker: UIDatePicker = {
        let mainDatePicker: UIDatePicker = UIDatePicker()
        mainDatePicker.datePickerMode = UIDatePicker.Mode.date
        
        return mainDatePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        addAllContentsWithCode()
    }
    
    // MARK: - addAllContentsWithCode()
    /// ThirdViewController에 올려지는  코드로 이루어진 모든 컨텐츠들의 모음
    private func addAllContentsWithCode() {
        addPhoneNumTitle()
        addPhoneNumTxtField()
        addDateOfBirthLabel()
        addDateOfBirthDisplay()
        addMainDatePicker()
    }
    
    // MARK: - addPhoneNumTitle()
    /// 전화번호 레이블 Autolayout
    private func addPhoneNumTitle() {
        phoneNumTitle.translatesAutoresizingMaskIntoConstraints = false
        
//        phoneNumTitle.backgroundColor = .green
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(phoneNumTitle)
        
        let phoneNumLabelHeightValue: CGFloat = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        let phoneNumTop: NSLayoutConstraint
        phoneNumTop = phoneNumTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20)
        
        let phoneNumLeading: NSLayoutConstraint
        phoneNumLeading = phoneNumTitle.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let phoneNumTrailing: NSLayoutConstraint
        phoneNumTrailing = phoneNumTitle.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        let phoneNumHeight: NSLayoutConstraint
        phoneNumHeight = phoneNumTitle.heightAnchor.constraint(equalToConstant: phoneNumLabelHeightValue)
        
        phoneNumTop.isActive = true
        phoneNumLeading.isActive = true
        phoneNumTrailing.isActive = true
        phoneNumHeight.isActive = true
    }
    
    private func addPhoneNumTxtField() {
        
        phoneNumTxtField.translatesAutoresizingMaskIntoConstraints = false
        
//        phoneNumTxtField.backgroundColor = .red
        
        let guide = view.safeAreaLayoutGuide
        
        let phoneNumTxtHeightValue: CGFloat = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        self.view.addSubview(phoneNumTxtField)
        
        let phoneNumTxtCenterX: NSLayoutConstraint
        phoneNumTxtCenterX = phoneNumTxtField.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        
        let phoneNumTxtTop: NSLayoutConstraint
        phoneNumTxtTop = phoneNumTxtField.topAnchor.constraint(equalTo: phoneNumTitle.bottomAnchor)
        
        let phoneNumTxtLeading: NSLayoutConstraint
        phoneNumTxtLeading = phoneNumTxtField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let phoneNumTxtTrailing: NSLayoutConstraint
        phoneNumTxtTrailing = phoneNumTxtField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        let phoneNumTxtHeight: NSLayoutConstraint
        phoneNumTxtHeight = phoneNumTxtField.heightAnchor.constraint(equalToConstant: phoneNumTxtHeightValue)
        
        phoneNumTxtCenterX.isActive = true
        phoneNumTxtTop.isActive = true
        phoneNumTxtLeading.isActive = true
        phoneNumTxtTrailing.isActive = true
        phoneNumTxtHeight.isActive = true
    }
    
    private func addDateOfBirthLabel() {
        
        dateOfBirthTitle.translatesAutoresizingMaskIntoConstraints = false
        
//        dateOfBirthTitle.backgroundColor = .lightGray
        
        let guide = view.safeAreaLayoutGuide
                
        self.view.addSubview(dateOfBirthTitle)
        
        let dateOfBirthTop: NSLayoutConstraint
        dateOfBirthTop = dateOfBirthTitle.topAnchor.constraint(equalTo: phoneNumTxtField.bottomAnchor, constant: 20)
        
        let dateOfBirthLeading: NSLayoutConstraint
        dateOfBirthLeading = dateOfBirthTitle.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let dateOfBirthWidth: NSLayoutConstraint
        dateOfBirthWidth = dateOfBirthTitle.widthAnchor.constraint(equalTo: phoneNumTxtField.widthAnchor, multiplier: 0.5)
        
        
        dateOfBirthTop.isActive = true
        dateOfBirthLeading.isActive = true
        dateOfBirthWidth.isActive = true
        
    }
    
    private func addDateOfBirthDisplay() {
        dateOfBirthDisplay.translatesAutoresizingMaskIntoConstraints = false
        
//        dateOfBirthDisplay.backgroundColor = .red
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(dateOfBirthDisplay)
        
        let dateOfBirthDisplayTop: NSLayoutConstraint
        dateOfBirthDisplayTop = dateOfBirthDisplay.topAnchor.constraint(equalTo: phoneNumTxtField.bottomAnchor, constant: 20)
        
        let dateOfBirthDisplayLeading: NSLayoutConstraint
        dateOfBirthDisplayLeading = dateOfBirthDisplay.leadingAnchor.constraint(equalTo: dateOfBirthTitle.trailingAnchor)
        
        let dateOfBirthDisplayTrailing: NSLayoutConstraint
        dateOfBirthDisplayTrailing = dateOfBirthDisplay.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        dateOfBirthDisplayTop.isActive = true
        dateOfBirthDisplayLeading.isActive = true
        dateOfBirthDisplayTrailing.isActive = true
    }
    
    private func addMainDatePicker() {
        mainDatePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(mainDatePicker)
        
        let mainDatePickerTop: NSLayoutConstraint
        mainDatePickerTop = mainDatePicker.topAnchor.constraint(equalTo: dateOfBirthTitle.bottomAnchor, constant: 20)
        
        let mainDatePickerLeading: NSLayoutConstraint
        mainDatePickerLeading = mainDatePicker.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let mainDatePickerTrailing: NSLayoutConstraint
        mainDatePickerTrailing = mainDatePicker.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        mainDatePickerTop.isActive = true
        mainDatePickerLeading.isActive = true
        mainDatePickerTrailing.isActive = true
        
        
    }


}
