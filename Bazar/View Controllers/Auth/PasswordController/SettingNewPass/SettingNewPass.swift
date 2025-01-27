//
//  SettingNewPass.swift
//  Bazar
//
//  Created by Naveed Khalid on 24/01/2025.
//

import UIKit

class SettingNewPass: UIViewController {
    
    
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let resetPassLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Password"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "Create your new password, so you can login to your account."
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
  
    let newPasslbl: UILabel = {
        let label = UILabel()
        label.text = "New password"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let newPasslblTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter new Password"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.clear.cgColor
        
      
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
    
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter new Password",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )
        
        // Add target actions for editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
    }()
    
    private var isNewPassVisible = false
    
    private let newPassPreviewBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.appColor(.grey)
        button.addTarget(self, action: #selector(toggleNewPassVisibility), for: .touchUpInside)
        return button
    }()
    
    let confirmPasslbl: UILabel = {
        let label = UILabel()
        label.text = "Confirm password"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let confirmPasslblTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Your Password"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.clear.cgColor
        
      
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
    
        textField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Your Password",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )
        
        // Add target actions for editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
    }()


   
    private var isConfirmPassVisible = false

    private let confirmPassPreviewBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor.appColor(.grey)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleConfirmPassVisibility), for: .touchUpInside)
        return button
    }()

    @objc private func toggleNewPassVisibility() {
        isNewPassVisible.toggle()
        newPasslblTextField.isSecureTextEntry = !isNewPassVisible
        
        // Update the preview button image
        let imageName = isNewPassVisible ? "eye" : "eye.slash.fill"
        newPassPreviewBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @objc private func toggleConfirmPassVisibility() {
        isConfirmPassVisible.toggle()
        confirmPasslblTextField.isSecureTextEntry = !isConfirmPassVisible
        
        // Update the preview button image
        let imageName = isConfirmPassVisible ? "eye" : "eye.slash.fill"
        confirmPassPreviewBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }

    
    
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
        
        setUpNewPasslbl()
        setUPNewPasslblTextField()
        setUpNewPassPreview()
        
        setUpConfirmPasslbl()
        setUpConfirmPasslblTextField()
        setUpConfirmPassPreviewBtn()
        
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
    
    
    private func setUpNewPasslbl(){
        view.addSubview(newPasslbl)
        NSLayoutConstraint.activate([
            newPasslbl.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 24),
            newPasslbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUPNewPasslblTextField(){
        view.addSubview(newPasslblTextField)
        NSLayoutConstraint.activate([
            newPasslblTextField.topAnchor.constraint(equalTo: newPasslbl.bottomAnchor, constant: 6),
            newPasslblTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            newPasslblTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            newPasslblTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    private func setUpNewPassPreview(){
        newPasslblTextField.addSubview(newPassPreviewBtn)
        NSLayoutConstraint.activate([
            newPassPreviewBtn.trailingAnchor.constraint(equalTo: newPasslblTextField.trailingAnchor, constant: -16),
            newPassPreviewBtn.centerYAnchor.constraint(equalTo: newPasslblTextField.centerYAnchor),
            newPassPreviewBtn.widthAnchor.constraint(equalToConstant: 24),
            newPassPreviewBtn.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    
    
    private func setUpConfirmPasslbl(){
        view.addSubview(confirmPasslbl)
        NSLayoutConstraint.activate([
            confirmPasslbl.topAnchor.constraint(equalTo: newPasslblTextField.bottomAnchor, constant: 16),
            confirmPasslbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            
        ])
    }
    
    
    private func setUpConfirmPasslblTextField(){
        view.addSubview(confirmPasslblTextField)
        NSLayoutConstraint.activate([
            confirmPasslblTextField.topAnchor.constraint(equalTo: confirmPasslbl.bottomAnchor, constant: 6),
            confirmPasslblTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            confirmPasslblTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            confirmPasslblTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    
    private func setUpConfirmPassPreviewBtn(){
        confirmPasslblTextField.addSubview(confirmPassPreviewBtn)
        NSLayoutConstraint.activate([
            confirmPassPreviewBtn.trailingAnchor.constraint(equalTo: confirmPasslblTextField.trailingAnchor, constant: -16),
            confirmPassPreviewBtn.centerYAnchor.constraint(equalTo: confirmPasslblTextField.centerYAnchor),
            confirmPassPreviewBtn.widthAnchor.constraint(equalToConstant: 24),
            confirmPassPreviewBtn.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    
    private func setUpSendButton(){
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: confirmPassPreviewBtn.bottomAnchor, constant: 24),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            sendButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    // Actions for border color change
    @objc private func textFieldEditingDidBegin(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.appColor(.purple)?.cgColor
    }

    @objc private func textFieldEditingDidEnd(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
    }
  
}





