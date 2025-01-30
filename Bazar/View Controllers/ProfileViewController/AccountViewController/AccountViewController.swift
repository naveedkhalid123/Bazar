//
//  AccountViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class AccountViewController: UIViewController {
    
    var isPasswordVisible = false
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let accountLbl: UILabel = {
        let label = UILabel()
        label.text = "My Account"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = .zero
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    
    private let profileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appColor(.lightGrey)
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "accountImage")
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    private let changePictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Picture", for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 16)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

   
    
    let namelbl: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
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
            string: "Enter your name",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    let emaillbl: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
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
    
    
    
    let newPasslbl: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let newPasslblTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    private let passPreviewBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor.appColor(.grey)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func previewButtonPressed(_ sender: UIButton) {
        isPasswordVisible.toggle()

        newPasslblTextField.isSecureTextEntry = !isPasswordVisible
        let buttonImage = isPasswordVisible ? "eye" : "eye.slash.fill"
        passPreviewBtn.setImage(UIImage(systemName: buttonImage), for: .normal)
    }
    
    
    private let saveButtonButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Save Button", for: .normal)
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
        setUpHeaderView()
        setUpbackButton()
        setUpAccountLbl()
        
        setupScrollView()
        
        setUpProfileView()
        setUpProfileImageView()
        
        setUpChangePictureLbl()
        
        setUpNamelbl()
        setUpNameTextField()
        
        setEmaillbl()
        setUpEmailTextField()
        
        setUpEmaillbl()
        setUpTfView()
        setUpPhoneImage()
        setUpPhoneTextField()
        
        setUpNewPasslbl()
        setUpNewPasslblTextField()
        setUpPassPreviewBtn()
       
        setUpContinueButton()
       
        
    }
    
    
    private func setUpHeaderView() {
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpbackButton(){
        headerView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    private func setUpAccountLbl(){
        headerView.addSubview(accountLbl)
        NSLayoutConstraint.activate([
            accountLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            accountLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    

    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
    }
    
    private func setUpProfileView(){
        scrollContainer.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    
    private func setUpProfileImageView(){
        scrollContainer.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -50),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    private func setUpChangePictureLbl(){
        scrollContainer.addSubview(changePictureButton)
        NSLayoutConstraint.activate([
            changePictureButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            changePictureButton.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor)
        ])
    }
    
    
    private func setUpNamelbl(){
        scrollContainer.addSubview(namelbl)
        NSLayoutConstraint.activate([
            namelbl.topAnchor.constraint(equalTo: changePictureButton.bottomAnchor, constant: 40),
            namelbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpNameTextField(){
        scrollContainer.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: namelbl.bottomAnchor, constant: 6),
            nameTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setEmaillbl(){
        scrollContainer.addSubview(emaillbl)
        NSLayoutConstraint.activate([
            emaillbl.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emaillbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpEmailTextField(){
        scrollContainer.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emaillbl.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    private func setUpEmaillbl(){
        scrollContainer.addSubview(phoneNumberlbl)
        NSLayoutConstraint.activate([
            phoneNumberlbl.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 24),
            phoneNumberlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpTfView(){
        scrollContainer.addSubview(tfView)
        NSLayoutConstraint.activate([
            tfView.topAnchor.constraint(equalTo: phoneNumberlbl.bottomAnchor, constant: 6),
            tfView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            tfView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
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
    
    
    private func setUpNewPasslbl(){
        scrollContainer.addSubview(newPasslbl)
        NSLayoutConstraint.activate([
            newPasslbl.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 24),
            newPasslbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpNewPasslblTextField(){
        scrollContainer.addSubview(newPasslblTextField)
        NSLayoutConstraint.activate([
            newPasslblTextField.topAnchor.constraint(equalTo: newPasslbl.bottomAnchor, constant: 6),
            newPasslblTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            newPasslblTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            newPasslblTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpPassPreviewBtn(){
        newPasslblTextField.addSubview(passPreviewBtn)
        NSLayoutConstraint.activate([
            passPreviewBtn.trailingAnchor.constraint(equalTo: newPasslblTextField.trailingAnchor, constant: -16),
            passPreviewBtn.centerYAnchor.constraint(equalTo: newPasslblTextField.centerYAnchor),
            passPreviewBtn.widthAnchor.constraint(equalToConstant: 24),
            passPreviewBtn.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    
    private func setUpContinueButton(){
        scrollContainer.addSubview(saveButtonButton)
        NSLayoutConstraint.activate([
            saveButtonButton.topAnchor.constraint(equalTo: newPasslblTextField.bottomAnchor, constant: 40),
            saveButtonButton.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            saveButtonButton.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            saveButtonButton.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            saveButtonButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
