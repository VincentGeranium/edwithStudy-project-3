//
//  SecondViewController.swift
//  PJT2-SignUp
//
//  Created by 김광준 on 2019/10/24.
//  Copyright © 2019 VincentGeranium. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let secondVCImgView = UIImageView()
    lazy var imgPicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addViewsWithCodeInSecondVC()
    }
    
    private func addViewsWithCodeInSecondVC() {
        
        addSecondVCImgView()
        
    }
    
    private func addSecondVCImgView() {
        
        secondVCImgView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = view.safeAreaLayoutGuide
        
        self.view.addSubview(secondVCImgView)
        
        secondVCImgView.backgroundColor = .lightGray
        
        secondVCImgView.contentMode = .scaleAspectFit
        
        let secondImgViewTop: NSLayoutConstraint
        secondImgViewTop = secondVCImgView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20)
        
        let secondImgViewLeading: NSLayoutConstraint
        secondImgViewLeading = secondVCImgView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20)
        
        let secondImgViewWidth: NSLayoutConstraint
        secondImgViewWidth = secondVCImgView.widthAnchor.constraint(equalToConstant: 200)
        
        let secondImgViewHeight: NSLayoutConstraint
        secondImgViewHeight = secondVCImgView.heightAnchor.constraint(equalToConstant: 200)
        
        secondImgViewTop.isActive = true
        secondImgViewLeading.isActive = true
        secondImgViewWidth.isActive = true
        secondImgViewHeight.isActive = true
        
        /// ImageView에 Tap Gesture 달아주기
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTappedImgView(_:)))
        
        secondVCImgView.isUserInteractionEnabled = true
        secondVCImgView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func didTappedImgView(_ sender: UIImageView) {
        self.present(self.imgPicker, animated: true, completion: nil)
    }

}
