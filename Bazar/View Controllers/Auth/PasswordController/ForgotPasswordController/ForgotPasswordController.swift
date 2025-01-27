//
//  ForgotPasswordController.swift
//  Bazar
//
//  Created by Naveed Khalid on 24/01/2025.
//


import UIKit

class ForgotPasswordController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let forgotPassLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forgot Password"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    private let subHead: UILabel = {
        let label = UILabel()
        label.text = "Select which contact details should we use to reset your password"
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.appColor(.lightGrey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc private func emailButtonTapped() {
        print("Email button tapped!")
        
        emailViewButton.isSelected = true
        phoneViewButton.isSelected = false
    
        updateButtonUI()
    }

    @objc private func phoneButtonTapped() {
        print("Phone button tapped!")
        
        phoneViewButton.isSelected = true
        emailViewButton.isSelected = false

        updateButtonUI()
    }



    
    private let emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purpleEmail")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailHead: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailSubHead: UILabel = {
        let label = UILabel()
        label.text = "Send to your email"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.appColor(.lightGrey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greyPhone")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let phonelHead: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneSubHead: UILabel = {
        let label = UILabel()
        label.text = "Send to your phone"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(phoneButtonTapped), for: .touchUpInside)
        return button
    }()

 
 
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Continue", for: .normal)
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
    
    private func setUp() {
        setUpBackArrow()
        setUpForgotPassLbl()
        setUpSubHead()
        
        setUpStackView()
        
        setUpEmailImage()
        setUpEmailHead()
        setUpEmailSubHead()
        setUpEmailViewButton()
        
        setUpPhoneImage()
        setUpPhoneHead()
        setUpPhoneSubHead()
        setUpPhoneViewButton()
        
        setUpContinueButton()
    }
    
    private func setUpBackArrow() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setUpForgotPassLbl() {
        view.addSubview(forgotPassLbl)
        NSLayoutConstraint.activate([
            forgotPassLbl.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            forgotPassLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }

    private func setUpSubHead() {
        view.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.topAnchor.constraint(equalTo: forgotPassLbl.bottomAnchor, constant: 8),
            subHead.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subHead.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    private func setUpStackView() {
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(phoneView)
    
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 151)
        ])
    }
    
    
    
    private func setUpEmailViewButton(){
        emailView.addSubview(emailViewButton)
        NSLayoutConstraint.activate([
            emailViewButton.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 0),
            emailViewButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 0),
            emailViewButton.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 0),
            emailViewButton.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 0),
            
        ])
    }
    
    
    private func setUpPhoneViewButton(){
        phoneView.addSubview(phoneViewButton)
        NSLayoutConstraint.activate([
            phoneViewButton.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 0),
            phoneViewButton.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: 0),
            phoneViewButton.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 0),
            phoneViewButton.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 0),
            
        ])
    }
    
    
    
    private func setUpEmailImage(){
        emailView.addSubview(emailImageView)
        NSLayoutConstraint.activate([
            emailImageView.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 24),
            emailImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
            emailImageView.widthAnchor.constraint(equalToConstant: 48),
            emailImageView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setUpEmailHead(){
        emailView.addSubview(emailHead)
        NSLayoutConstraint.activate([
            emailHead.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: 16),
            emailHead.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
            
        ])
    }
    
    private func setUpEmailSubHead(){
        emailView.addSubview(emailSubHead)
        NSLayoutConstraint.activate([
            emailSubHead.topAnchor.constraint(equalTo: emailHead.bottomAnchor, constant: 2),
            emailSubHead.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
            
        ])
    }
    
    
    private func setUpPhoneImage(){
        phoneView.addSubview(phoneImageView)
        NSLayoutConstraint.activate([
            phoneImageView.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 24),
            phoneImageView.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 16),
            phoneImageView.widthAnchor.constraint(equalToConstant: 48),
            phoneImageView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setUpPhoneHead(){
        phoneView.addSubview(phonelHead)
        NSLayoutConstraint.activate([
            phonelHead.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 16),
            phonelHead.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 16),
            
        ])
    }
    
    private func setUpPhoneSubHead(){
        phoneView.addSubview(phoneSubHead)
        NSLayoutConstraint.activate([
            phoneSubHead.topAnchor.constraint(equalTo: phonelHead.bottomAnchor, constant: 2),
            phoneSubHead.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 16),
            
        ])
    }
    
    
    
    private func setUpContinueButton(){
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 49),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    
    private func updateButtonUI() {
     
        if emailViewButton.isSelected {
            emailViewButton.layer.borderColor = UIColor.appColor(.purple)?.cgColor
            emailViewButton.layer.borderWidth = 1
            emailViewButton.layer.cornerRadius = 8
        } else {
            emailViewButton.layer.borderColor = UIColor.clear.cgColor
            emailViewButton.layer.borderWidth = 0
        }
        
        
        if phoneViewButton.isSelected {
            phoneViewButton.layer.borderColor = UIColor.appColor(.purple)?.cgColor
            phoneViewButton.layer.borderWidth = 1
            phoneViewButton.layer.cornerRadius = 8
        } else {
            phoneViewButton.layer.borderColor = UIColor.clear.cgColor
            phoneViewButton.layer.borderWidth = 0
        }
    }


}
