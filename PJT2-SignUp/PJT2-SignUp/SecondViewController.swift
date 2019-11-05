//
//  SecondViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/10/24.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    // MARK: - secondVCImgView
    let secondVCImgView = UIImageView()
    
    // MARK: - nextButton
    lazy var nextBtn: UIButton = {
        let nextButton: UIButton = UIButton(type: .custom)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitle("다음", for: .selected)
        nextButton.setTitleColor(.blue, for: .selected)
        nextButton.setTitleColor(.lightGray, for: .normal)
//        nextButton.backgroundColor = .lightGray
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return nextButton
    }()
    
    // MARK: - cancelButton
    lazy var cancelBtn: UIButton = {
        let cancelButton: UIButton = UIButton(type: .custom)
//        cancelButton.backgroundColor = .red
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return cancelButton
    }()
    
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
        
        
        
        
        tapGesture()
        textFieldsDelegate()
        addViewsWithCodeInSecondVC()
//        validation()
        
    }
    
    // MARK: - textFieldsDelegate
    private func textFieldsDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    // MARK: - textFieldShouldReturn
    /// when user tapped return key the keyboard will be hidden
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // MARK: - tapGesture
    /// when tapped view the keyboard will be hidden
    private func tapGesture() {
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - gestureRecognizer
    // endEditing
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    private func addViewsWithCodeInSecondVC() {
        addSecondVCImgView()
        addIdTextField()
        addPasswordTextField()
        addCheckPasswordTextField()
        addMainTextView()
        addNextBtn()
        addCancelBtn()
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
        // 이미지피커에서 이미지를 골라 편집 가능하게(picker.allowsEditing = true) 했으므로 그 편집된 이미지(UIImagePickerController.InfoKey.editedImage)를 가져오게 만듦
        if let originalImg: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
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
    
//    MARK: - addMainTextView
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
    
    // MARK: - addNextBtn
    private func addNextBtn() {
        
        nextBtn.addTarget(self, action: #selector(validation), for: .touchUpInside)
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(nextBtn)
        
        let nextBtnTop: NSLayoutConstraint
        nextBtnTop = nextBtn.topAnchor.constraint(equalTo: mainTextView.bottomAnchor, constant: 10)
        
        let nextBtnTrailing: NSLayoutConstraint
        nextBtnTrailing = nextBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -7)
        
        let nextBtnWidth: NSLayoutConstraint
        nextBtnWidth = nextBtn.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.5)
        
        let nextBtnBottom: NSLayoutConstraint
        nextBtnBottom = nextBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        
        
        nextBtnTop.isActive = true
        nextBtnTrailing.isActive = true
        nextBtnWidth.isActive = true
        nextBtnBottom.isActive = true
        
//        print("\(view.bounds.size.width)")
        
    }
    
    @objc private func didTappedNextBtn() {
        print("tapped next btn")
    }
    
    // MARK: - addCancelBtn
    private func addCancelBtn() {
        
        cancelBtn.addTarget(self, action: #selector(didTappedCancelBtn), for: .touchUpInside)
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(cancelBtn)
        
        let cancelBtnTop: NSLayoutConstraint
        cancelBtnTop = cancelBtn.topAnchor.constraint(equalTo: mainTextView.bottomAnchor, constant: 10)
        
        let cancelBtnLeading: NSLayoutConstraint
        cancelBtnLeading = cancelBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 7)
        
        let cancelBtnWidth: NSLayoutConstraint
        cancelBtnWidth = cancelBtn.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.5)
        
        let cancelBtnBottom: NSLayoutConstraint
        cancelBtnBottom = cancelBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        
        cancelBtnTop.isActive = true
        cancelBtnLeading.isActive = true
        cancelBtnWidth.isActive = true
        cancelBtnBottom.isActive = true
        
    }
    
    @objc private func didTappedCancelBtn() {
        print("tapped cancel btn")
    }
    
   @objc private func validation() {
      
            if passwordTextField.text == checkPasswordTextField.text && idTextField.text?.isEmpty == false && secondVCImgView.image != nil && mainTextView.text?.isEmpty == false {
                nextBtn.isSelected = true
                print("go to next View")
            } else {
                nextBtn.isSelected = false
                print("noting action")
            }
        
    }
}
