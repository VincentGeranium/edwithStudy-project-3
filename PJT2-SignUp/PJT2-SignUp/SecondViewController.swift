//
//  SecondViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/10/24.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - secondVCImgView
    let secondVCImgView = UIImageView()
    
    // MARK: - imgPicker
    lazy var imgPicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        /// 이미지 피커를 이용하여 이미지를 선택하고 편집이 가능하게 함
        picker.allowsEditing = true
        return picker
    }()
    
    // MARK: - idTextField
    lazy var idTextField: UITextField = {
        let id: UITextField = UITextField()
        id.placeholder = "ID"
        id.borderStyle = .roundedRect
       return id
    }()
    
    // MARK: - passwordTextField
    lazy var passwordTextField: UITextField = {
        let password: UITextField = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
       return password
    }()
    
    // MARK: - checkPasswordTextField
    lazy var checkPasswordTextField: UITextField = {
        let checkBox: UITextField = UITextField()
        checkBox.placeholder = "Check Password"
        checkBox.borderStyle = .roundedRect
        return checkBox
    }()
    
    // MARK: - mainTextView
    lazy var mainTextView: UITextView = {
        let yellowTextView: UITextView = UITextView()
        yellowTextView.backgroundColor = .yellow
        return yellowTextView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addViewsWithCodeInSecondVC()
    }
    
    private func addViewsWithCodeInSecondVC() {
        addSecondVCImgView()
        addIdTextField()
        addPasswordTextField()
        addCheckPasswordTextField()
        addMainTextView()
    }
    
    // MARK: - addSecondVCImgView
    private func addSecondVCImgView() {
        
        secondVCImgView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(secondVCImgView)
        
        secondVCImgView.backgroundColor = .lightGray
        secondVCImgView.contentMode = .scaleToFill
        
        let secondImgViewTop: NSLayoutConstraint
        secondImgViewTop = secondVCImgView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20)
        
        let secondImgViewLeading: NSLayoutConstraint
        secondImgViewLeading = secondVCImgView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let secondImgViewWidth: NSLayoutConstraint
        secondImgViewWidth = secondVCImgView.widthAnchor.constraint(equalToConstant: 150)
        
        let secondImgViewHeight: NSLayoutConstraint
        secondImgViewHeight = secondVCImgView.heightAnchor.constraint(equalToConstant: 150)
        
        secondImgViewTop.isActive = true
        secondImgViewLeading.isActive = true
        secondImgViewWidth.isActive = true
        secondImgViewHeight.isActive = true
        
        /// ImageView에 Tap Gesture 달아주기
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTappedImgView(_:)))
        secondVCImgView.isUserInteractionEnabled = true
        secondVCImgView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // 이미지 뷰를 탭 했을 떄
    // MARK: - didTappedImgView
    @objc func didTappedImgView(_ sender: UIImageView) {
        self.present(self.imgPicker, animated: true, completion: nil)
    }
    
    // 이미지 피커 취소시
    // MARK: - imagePickerControllerDidCancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 이미지 피커를 이용하여 이미지를 선택했을 때
    // MARK: - imagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImg: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.secondVCImgView.image = originalImg
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - addIdTextField
    private func addIdTextField() {
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.safeAreaLayoutGuide
        
        let idTextFieldHeight: CGFloat = (view.bounds.size.height - (view.bounds.size.height - 34))
        
        self.view.addSubview(idTextField)
        
        let idTop: NSLayoutConstraint
        idTop = idTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20)
        
        let idLeading: NSLayoutConstraint
        idLeading = idTextField.leadingAnchor.constraint(equalTo: secondVCImgView.trailingAnchor, constant: 20)
        
        let idTrailing: NSLayoutConstraint
        idTrailing = idTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        let idHeight: NSLayoutConstraint
        idHeight = idTextField.heightAnchor.constraint(equalToConstant: idTextFieldHeight)
        
        idTop.isActive = true
        idLeading.isActive = true
        idTrailing.isActive = true
        idHeight.isActive = true
    }
    
    // MARK: - addPasswordTextField
    private func addPasswordTextField() {
         passwordTextField.translatesAutoresizingMaskIntoConstraints = false
         
         let guide = self.view.safeAreaLayoutGuide
         
         let passwordTextFieldHeight: CGFloat = (view.bounds.size.height - (view.bounds.size.height - 34))
         
         self.view.addSubview(passwordTextField)
         
         let passwordTop: NSLayoutConstraint
         passwordTop = passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 16)
         
         let passwordLeading: NSLayoutConstraint
         passwordLeading = passwordTextField.leadingAnchor.constraint(equalTo: secondVCImgView.trailingAnchor, constant: 20)
         
         let passwordTrailing: NSLayoutConstraint
         passwordTrailing = passwordTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
         
         let passwordHeight: NSLayoutConstraint
         passwordHeight = passwordTextField.heightAnchor.constraint(equalToConstant: passwordTextFieldHeight)
         
         passwordTop.isActive = true
         passwordLeading.isActive = true
         passwordTrailing.isActive = true
         passwordHeight.isActive = true
     }
    
    // MARK: - addCheckPasswordTextField
    private func addCheckPasswordTextField() {
           checkPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
           
           let guide = self.view.safeAreaLayoutGuide
           
           let checkPasswordTextFieldHeight: CGFloat = (view.bounds.size.height - (view.bounds.size.height - 34))
           
           self.view.addSubview(checkPasswordTextField)
           
           let checkPasswordTop: NSLayoutConstraint
           checkPasswordTop = checkPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16)
           
           let checkPasswordLeading: NSLayoutConstraint
           checkPasswordLeading = checkPasswordTextField.leadingAnchor.constraint(equalTo: secondVCImgView.trailingAnchor, constant: 20)
           
           let checkPasswordTrailing: NSLayoutConstraint
           checkPasswordTrailing = checkPasswordTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
           
           let checkPasswordHeight: NSLayoutConstraint
           checkPasswordHeight = checkPasswordTextField.heightAnchor.constraint(equalToConstant: checkPasswordTextFieldHeight)
           
           checkPasswordTop.isActive = true
           checkPasswordLeading.isActive = true
           checkPasswordTrailing.isActive = true
           checkPasswordHeight.isActive = true
       }
    
    // MARK: - addMainTextView
    private func addMainTextView() {
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(mainTextView)
        
        let mainTextViewTop: NSLayoutConstraint
        mainTextViewTop = mainTextView.topAnchor.constraint(equalTo: secondVCImgView.bottomAnchor, constant: 20)
        
        let mainTextViewLeading: NSLayoutConstraint
        mainTextViewLeading = mainTextView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let mainTextViewTrailing: NSLayoutConstraint
        mainTextViewTrailing = mainTextView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20)
        
        let mainTextViewBottom: NSLayoutConstraint
        mainTextViewBottom = mainTextView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -100)
        
        mainTextViewTop.isActive = true
        mainTextViewLeading.isActive = true
        mainTextViewTrailing.isActive = true
        mainTextViewBottom.isActive = true
    }
}
