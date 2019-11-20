//
//  ThirdViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/11/06.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    // MARK: - phoneNumTitle
    /// 전화번호 타이틀 레이블
    lazy var phoneNumTitle: UILabel = {
        let phoneNumTitle: UILabel = UILabel()
        phoneNumTitle.text = "전화번호"
        phoneNumTitle.textAlignment = NSTextAlignment.left
        phoneNumTitle.textColor = UIColor.black
        phoneNumTitle.font = UIFont.systemFont(ofSize: 20)
        
        return phoneNumTitle
    }()
    
    // MARK: - phoneNumTxtField
    lazy var phoneNumTxtField: UITextField = {
        let phoneNumTxtField: UITextField = UITextField()
        phoneNumTxtField.borderStyle = .roundedRect
        phoneNumTxtField.keyboardType = .numberPad
        phoneNumTxtField.becomeFirstResponder()
        
        return phoneNumTxtField
    }()
    
    // MARK: - dateOfBirthTitle
    lazy var dateOfBirthTitle: UILabel = {
        let dateOfBirthTitle: UILabel = UILabel()
        dateOfBirthTitle.text = "생년월일"
        dateOfBirthTitle.textAlignment = .left
        dateOfBirthTitle.textColor = .black
        dateOfBirthTitle.font = .systemFont(ofSize: 20)
        
        return dateOfBirthTitle
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        return dateFormatter
    }()
    
    lazy var myDateComponents: Calendar = {
        let myDateComponents = Calendar(identifier: .gregorian)
        return myDateComponents
    }()
    
    lazy var defaultDate: Date = {
        let defaultDate: Date = Date()
        return defaultDate
    }()
    
    lazy var myDefaultDate: String = {
        let myDefaultDate = self.dateFormatter.string(from: self.defaultDate)
        return myDefaultDate
    }()
    
    // MARK: - dateOfBirthDisplay
    lazy var dateOfBirthDisplay: UILabel = {
        let dateOfBirthDisplay: UILabel = UILabel()
        
        dateOfBirthDisplay.text = self.myDefaultDate
        dateOfBirthDisplay.textAlignment = .left
        dateOfBirthDisplay.textColor = .black
        dateOfBirthDisplay.font = .systemFont(ofSize: 20)
        
        return dateOfBirthDisplay
    }()
    
    
    
    // MARK: - mainDatePicker
    lazy var mainDatePicker: UIDatePicker = {
        let mainDatePicker: UIDatePicker = UIDatePicker()
        mainDatePicker.datePickerMode = UIDatePicker.Mode.date
        
        return mainDatePicker
    }()
    
    // MARK: - cancelBtn
    lazy var cancelBtn: UIButton = {
        let cancelBtn: UIButton = UIButton()
        cancelBtn.setTitle("취소", for: .normal)
        cancelBtn.setTitleColor(.red, for: .normal)
        
        return cancelBtn
    }()
    
    // MARK: - goBackBtn
    lazy var goBackBtn: UIButton = {
        let goBackBtn: UIButton = UIButton()
        goBackBtn.setTitle("이전", for: .normal)
        goBackBtn.setTitleColor(.blue, for: .normal)
        return goBackBtn
    }()
    
    // MARK: - signUpConfirmBtn
    lazy var signUpConfirmBtn: UIButton = {
        let signUpConfirmBtn: UIButton = UIButton()
        signUpConfirmBtn.setTitle("가입", for: .normal)
        signUpConfirmBtn.setTitleColor(.blue, for: .selected)
        signUpConfirmBtn.setTitleColor(.lightGray, for: .normal)
        
        return signUpConfirmBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        addAllContentsWithCode()
        addAllConfigureWithCode()
        addAllDelegate()
        
        
    }
    
    // MARK: - addAllContentsWithCode()
    /// ThirdViewController에 올려지는  코드로 이루어진 모든 컨텐츠들의 모음
    private func addAllContentsWithCode() {
        addPhoneNumTitle()
        addPhoneNumTxtField()
        addDateOfBirthLabel()
        addDateOfBirthDisplay()
        addMainDatePicker()
        addCancelBtn()
        addGoBackBtn()
        addSignUpConfirmBtn()
    }
    
    // MARK: - addAllConfigureWithCode()
    private func addAllConfigureWithCode() {
        mainDatePickerConfigure()
        cancelBtnConfigure()
        goBackBtnConfigure()
        phoneNumTxtConfigure()
    }
    
    private func addAllDelegate() {
        phoneNumTxtField.delegate = self
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
    
    // MARK: - addPhoneNumTxtField()
    /// 전화번호 텍스트필드 Autolayout
    private func addPhoneNumTxtField() {
        
        phoneNumTxtField.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    private func phoneNumTxtConfigure() {
        phoneNumTxtField.addTarget(self, action: #selector(didTappedPhoneTxtField), for: .allEvents)
    }
    
    @objc private func didTappedPhoneTxtField() {
        validationOfSignBtn()
    }
    
    
    // MARK: - addDateOfBirthLabel()
    /// 생년월일 타이틀 레이블 Autolayout
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
    
    // MARK: - addDateOfBirthDisplay()
    /// 생년월일이 표시되는 레이블 Autolayout
    private func addDateOfBirthDisplay() {
        dateOfBirthDisplay.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    // MARK: - addMainDatePicker()
    /// DatePicker Autolayout
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
    
    // MARK: - mainDatePickerConfigure()
    /// datePicker의 Target-Action pattern 생성
    private func mainDatePickerConfigure() {
        mainDatePicker.addTarget(self, action: #selector(dateValueChange), for: .valueChanged)
    }
    
    // MARK: - dateValueChange
    /// datePicker의 date가 바뀜에 따라 dateOfBirthDisplay의 text도 바뀌게 만드는 method
    @objc private func dateValueChange() {
        let datePickerDate = mainDatePicker.date
        
        let dateValue = dateFormatter.string(from: datePickerDate)
        
        self.dateOfBirthDisplay.text = dateValue
        
        validationOfSignBtn()
    }
    
    
    // MARK: - addCancelBtn()
    /// CancelBtn Autolayout
    private func addCancelBtn() {
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(cancelBtn)
        
        let cancelBtnTop: NSLayoutConstraint
        cancelBtnTop = cancelBtn.topAnchor.constraint(equalTo: mainDatePicker.bottomAnchor, constant: 20)
        
        let cancelBtnLeading: NSLayoutConstraint
        cancelBtnLeading = cancelBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor)
        
        let cancelBtnWidth: NSLayoutConstraint
        cancelBtnWidth = cancelBtn.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 1/3)
        
        let cancelBtnHeight: NSLayoutConstraint
        cancelBtnHeight = cancelBtn.heightAnchor.constraint(equalToConstant: 100)
        
        cancelBtnTop.isActive = true
        cancelBtnLeading.isActive = true
        cancelBtnWidth.isActive = true
        cancelBtnHeight.isActive = true
    }
    
    // MARK: - cancelBtnConfigure()
    /// cancelBtn Target-Action method
    private func cancelBtnConfigure() {
        cancelBtn.addTarget(self, action: #selector(didTappedCancelBtn), for: .touchUpInside)
    }
    
    // MARK: - didTappedCancelBtn()
    /// When didTapped cancel Btn, excute this code
    @objc private func didTappedCancelBtn() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - addGoBackBtn()
    /// goBackBtn Autolayout
    private func addGoBackBtn() {
        
        goBackBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(goBackBtn)
        
        let goBackBtnTop: NSLayoutConstraint
        goBackBtnTop = goBackBtn.topAnchor.constraint(equalTo: mainDatePicker.bottomAnchor, constant: 20)
        
        let goBackBtnLeading: NSLayoutConstraint
        goBackBtnLeading = goBackBtn.leadingAnchor.constraint(equalTo: cancelBtn.trailingAnchor)
        
        let goBackBtnWidth: NSLayoutConstraint
        goBackBtnWidth = goBackBtn.widthAnchor.constraint(equalTo: cancelBtn.widthAnchor, multiplier: 1)
        
        let goBackBtnHeight: NSLayoutConstraint
        goBackBtnHeight = goBackBtn.heightAnchor.constraint(equalTo: cancelBtn.heightAnchor, multiplier: 1)
        
        goBackBtnTop.isActive = true
        goBackBtnLeading.isActive = true
        goBackBtnWidth.isActive = true
        goBackBtnHeight.isActive = true
    }
    
    private func goBackBtnConfigure() {
        goBackBtn.addTarget(self, action: #selector(didTappedGoBackBtn), for: .touchUpInside)
    }
    
    @objc private func didTappedGoBackBtn() {
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - addSignUpConfirmBtn()
    /// signUpConfirmBtn Autolayout
    private func addSignUpConfirmBtn() {
        
        signUpConfirmBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(signUpConfirmBtn)
        
        let signUpConfirmBtnTop: NSLayoutConstraint
        signUpConfirmBtnTop = signUpConfirmBtn.topAnchor.constraint(equalTo: mainDatePicker.bottomAnchor, constant: 20)
        
        let signUpConfirmBtnLeading: NSLayoutConstraint
        signUpConfirmBtnLeading = signUpConfirmBtn.leadingAnchor.constraint(equalTo: goBackBtn.trailingAnchor)
        
        let signUpConfirmBtnWidth: NSLayoutConstraint
        signUpConfirmBtnWidth = signUpConfirmBtn.widthAnchor.constraint(equalTo: goBackBtn.widthAnchor, multiplier: 1)
        
        let signUpConfirmBtnHeight: NSLayoutConstraint
        signUpConfirmBtnHeight = signUpConfirmBtn.heightAnchor.constraint(equalTo: goBackBtn.heightAnchor, multiplier: 1)
        
        signUpConfirmBtnTop.isActive = true
        signUpConfirmBtnLeading.isActive = true
        signUpConfirmBtnWidth.isActive = true
        signUpConfirmBtnHeight.isActive = true
        
        
    }
    
    private func phoneNumValidation() -> Bool {
        
        if phoneNumTxtField.text?.isEmpty == false {
            print("phoneNumTxtField is Filled")
            
            return true
        } else {
            print("phoneNumTxtField is not Filled")
            
            return false
        }
    }
    
    private func dateOfBirthValidation() -> Bool {
        
        let datePickerDate = mainDatePicker.date
        
        let dateValue = dateFormatter.string(from: datePickerDate)
        
        if self.myDefaultDate != dateValue && phoneNumTxtField.text?.isEmpty == false {
            
            dateOfBirthDisplay.text = dateValue
            
            print("date value changed")
            
            return true
            
        } else if self.myDefaultDate != dateValue && phoneNumTxtField.text?.isEmpty == true {
            return false
        } else if self .myDefaultDate == dateValue && phoneNumTxtField.text?.isEmpty == true {
            return false
        }
        return false
    }
    
    private func validationOfSignBtn() -> Bool {
        if phoneNumValidation() == true && dateOfBirthValidation() == true {
            
            print("btn validation return true")
            signUpConfirmBtn.isSelected = true
            return true
        } else {
            print("btn validation return false")
            signUpConfirmBtn.isSelected = false
            return false
        }
    }
}
