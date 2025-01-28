//
//  ResetPasswordController.swift
//  Bazar
//
//  Created by Naveed Khalid on 24/01/2025.
//


import UIKit

class ResetPassWithEmail: UIViewController {
    
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
        label.text = "Please enter your email, we will send verification code to your email."
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emaillbl: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
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
            string: "Enter your email",
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
        setUpEmailTextField()
        setUpSendButton()
    }
    
    private func setUpBackArrow(){
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
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
        view.addSubview(emaillbl)
        NSLayoutConstraint.activate([
            emaillbl.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 24),
            emaillbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpEmailTextField(){
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emaillbl.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpSendButton(){
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            sendButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}
