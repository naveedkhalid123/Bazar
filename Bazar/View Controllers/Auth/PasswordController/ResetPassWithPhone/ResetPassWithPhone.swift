//
//  ResetPassWithPhone.swift
//  Bazar
//
//  Created by Naveed Khalid on 24/01/2025.
//

import UIKit

class ResetPassWithPhone: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let resetPassLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reset Password"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "Please enter your phone number, we will send a verification code to your phone number."
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let phoneNumberlbl: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let tfView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.lightGrey)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "phoneIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your Phone"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your Phone",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )
        
        return textField
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Send", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpBackArrow()
        setUPResetPassLbl()
        setUpSubHead()
        
        setUpEmaillbl()
        setUpTfView()
        setUpPhoneImage()
        setUpPhoneTextField()
        setUpSendButton()
    }
    
    private func setUpBackArrow(){
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setUPResetPassLbl(){
        view.addSubview(resetPassLbl)
        NSLayoutConstraint.activate([
            resetPassLbl.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            resetPassLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }

    private func setUpSubHead(){
        view.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.topAnchor.constraint(equalTo: resetPassLbl.bottomAnchor, constant: 8),
            subHead.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subHead.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
    }
    
    private func setUpEmaillbl(){
        view.addSubview(phoneNumberlbl)
        NSLayoutConstraint.activate([
            phoneNumberlbl.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 24),
            phoneNumberlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpTfView(){
        view.addSubview(tfView)
        NSLayoutConstraint.activate([
            tfView.topAnchor.constraint(equalTo: phoneNumberlbl.bottomAnchor, constant: 6),
            tfView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tfView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tfView.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpPhoneImage(){
        tfView.addSubview(phoneImage)
        NSLayoutConstraint.activate([
            phoneImage.leadingAnchor.constraint(equalTo: tfView.leadingAnchor, constant: 12),
            phoneImage.centerYAnchor.constraint(equalTo: tfView.centerYAnchor),
            phoneImage.widthAnchor.constraint(equalToConstant: 24),
            phoneImage.heightAnchor.constraint(equalToConstant: 24),
            
        ])
    }
    
    private func setUpPhoneTextField(){
        tfView.addSubview(phoneTextField)
        NSLayoutConstraint.activate([
            phoneTextField.centerYAnchor.constraint(equalTo: tfView.centerYAnchor),
            phoneTextField.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 8),
            phoneTextField.trailingAnchor.constraint(equalTo: tfView.trailingAnchor, constant: 0),
            phoneTextField.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
    private func setUpSendButton(){
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: tfView.bottomAnchor, constant: 24),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            sendButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}

