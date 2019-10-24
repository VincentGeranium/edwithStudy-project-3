//
//  ViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/10/22.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let idTextField = UITextField()
    let pwTextField = UITextField()
    let signInBtn = UIButton(type: .custom)
    let signUpBtn = UIButton(type: .custom)
    let titleImgView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        addViewsWithCode()
        
    }
    
    private func addViewsWithCode() {
        addTitleImgView()
        addIdTextField()
        addPwTextField()
        addSignInBtn()
        addSignUpBtn()
    }
    
    private func addTitleImgView() {
        
        guard let titleImg: UIImage = UIImage.init(named: "boostcourseImg") else {
            print("Error : titleImg의 이미지를 가져올 수 없습니다")
            return
        }
        
        titleImgView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleImgView)
        
        let guide = view.safeAreaLayoutGuide
        
        let imgViewWidthValue = (view.bounds.size.width - (view.bounds.size.width - 250))
        let imgViewHeightValue = (view.bounds.size.height - (view.bounds.size.height - 250))
        
        let titleImgTopAnchor: NSLayoutConstraint
        titleImgTopAnchor = titleImgView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20)
        
        let titleImgCenterX: NSLayoutConstraint
        titleImgCenterX = titleImgView.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        
        let titleImgWidth: NSLayoutConstraint
        titleImgWidth = titleImgView.widthAnchor.constraint(equalToConstant: imgViewWidthValue)
        
        let titleImgHeight: NSLayoutConstraint
        titleImgHeight = titleImgView.heightAnchor.constraint(equalToConstant: imgViewHeightValue)
       
        titleImgTopAnchor.isActive = true
        titleImgCenterX.isActive = true
        titleImgWidth.isActive = true
        titleImgHeight.isActive = true
        
        titleImgView.image = titleImg
    }
    
    private func addIdTextField() {
        
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(idTextField)
        
        let guide = view.safeAreaLayoutGuide
        
        let idTextFieldHeightValue = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        let idTop: NSLayoutConstraint
        idTop = idTextField.topAnchor.constraint(equalTo: titleImgView.bottomAnchor, constant: 20)
        
        let idLeading: NSLayoutConstraint
        idLeading = idTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40)
        
        let idTrailing: NSLayoutConstraint
        idTrailing = idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40)
        
        let idHeight: NSLayoutConstraint
        idHeight = idTextField.heightAnchor.constraint(equalToConstant: idTextFieldHeightValue)
        
        idTop.isActive = true
        idLeading.isActive = true
        idTrailing.isActive = true
        idHeight.isActive = true

        idTextField.placeholder = "ID"
        idTextField.borderStyle = .roundedRect
    }
    
    private func addPwTextField() {
        
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(pwTextField)
        
        let guide = view.safeAreaLayoutGuide
        
        let pwTextFieldHeightValue = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        let pwTop: NSLayoutConstraint
        pwTop = pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20)
        
        let pwLeading: NSLayoutConstraint
        pwLeading = pwTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 40)
        
        let pwTrailing: NSLayoutConstraint
        pwTrailing = pwTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -40)
        
        let pwHeight: NSLayoutConstraint
        pwHeight = pwTextField.heightAnchor.constraint(equalToConstant: pwTextFieldHeightValue)
        
        pwTop.isActive = true
        pwLeading.isActive = true
        pwTrailing.isActive = true
        pwHeight.isActive = true
        
        
        pwTextField.placeholder = "Password"
        pwTextField.borderStyle = .roundedRect
    }
    
    private func addSignInBtn() {
        
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(signInBtn)
        
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.setTitleColor(.blue, for: .normal)
        signInBtn.backgroundColor = .black
        
        let guide = view.safeAreaLayoutGuide
        
        let signInBtnWidthValue = (view.bounds.size.width - (view.bounds.size.width - 100))
        
        let signInBtnHeightValue = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        let signInBtnTop: NSLayoutConstraint
        signInBtnTop = signInBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 20)
        
        let signInBtnLeading = signInBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 80)
        
        let signInBtnWidth: NSLayoutConstraint
        signInBtnWidth = signInBtn.widthAnchor.constraint(equalToConstant: signInBtnWidthValue)
        
        let signInBtnHeight: NSLayoutConstraint
        signInBtnHeight = signInBtn.heightAnchor.constraint(equalToConstant: signInBtnHeightValue)
        
        signInBtnTop.isActive = true
        signInBtnLeading.isActive = true
        signInBtnWidth.isActive = true
        signInBtnHeight.isActive = true
        
    }
    
    private func addSignUpBtn() {
        
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(signUpBtn)
        
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(.red, for: .normal)
        
        signUpBtn.backgroundColor = .black
        
        let guide = view.safeAreaLayoutGuide
        
        let signUpBtnWidthValue = (view.bounds.size.width - (view.bounds.size.width - 100))
        
        let signUpBtnHeightValue = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        let signUpBtnLeadingValue = (view.bounds.size.width - (view.bounds.size.width - 40))
        
        let signUpBtnTop: NSLayoutConstraint
        signUpBtnTop = signUpBtn.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 20)
        
        let signUpBtnLeading = signUpBtn.leadingAnchor.constraint(equalTo: signInBtn.trailingAnchor, constant: signUpBtnLeadingValue)
        
        let signUpBtnWidth: NSLayoutConstraint
        signUpBtnWidth = signUpBtn.widthAnchor.constraint(equalToConstant: signUpBtnWidthValue)
        
        let signUpBtnHeight: NSLayoutConstraint
        signUpBtnHeight = signUpBtn.heightAnchor.constraint(equalToConstant: signUpBtnHeightValue)
        
        signUpBtnTop.isActive = true
        signUpBtnLeading.isActive = true
        signUpBtnWidth.isActive = true
        signUpBtnHeight.isActive = true
        
    }
    
    
    
    


}

