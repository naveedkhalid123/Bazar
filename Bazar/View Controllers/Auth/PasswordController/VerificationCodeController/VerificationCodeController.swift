//
//  VerificationCodeController.swift
//  Bazar
//
//  Created by Naveed Khalid on 25/01/2025.
//

import UIKit

class VerificationCodeController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let codeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Verification Code"
        label.textAlignment = .center
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "Please enter the code we just sent to email "
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailHead: UILabel = {
        let label = UILabel()
        label.text = "admin@gmail.com"
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let OTPView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.appColor(.lightGrey)
        return view
    }()

    private let labelButtonStack: UIStackView = {
        let label = UILabel()
        label.text = "If you didn’t receive a code? "
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.setTitle("Resend", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.addTarget(self, action: #selector(toggleNewPassVisibility), for: .touchUpInside)

    
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    private func setUp(){
        setUpBackArrow()
        setUPResetPassLbl()
        setUpSubHead()
        setUpEmailHead()
        
        setUpOTPView()
        
        setUpLabelButtonStack()
        setUpContinueButton()
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
        view.addSubview(codeLbl)
        NSLayoutConstraint.activate([
            codeLbl.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            codeLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setUpSubHead(){
        view.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.topAnchor.constraint(equalTo: codeLbl.bottomAnchor, constant: 8),
            subHead.centerXAnchor.constraint(equalTo: codeLbl.centerXAnchor)
        ])
    }
    
    private func setUpEmailHead(){
        view.addSubview(emailHead)
        NSLayoutConstraint.activate([
            emailHead.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 0),
            emailHead.centerXAnchor.constraint(equalTo: subHead.centerXAnchor)
        ])
    }
    
    private func setUpOTPView(){
        view.addSubview(OTPView)
        NSLayoutConstraint.activate([
            OTPView.topAnchor.constraint(equalTo: emailHead.bottomAnchor, constant: 40),
            OTPView.centerXAnchor.constraint(equalTo: emailHead.centerXAnchor),
            OTPView.heightAnchor.constraint(equalToConstant: 52),
            OTPView.widthAnchor.constraint(equalToConstant: 256)
            
        ])
    }
    
    private func setUpLabelButtonStack(){
        view.addSubview(labelButtonStack)
        NSLayoutConstraint.activate([
            labelButtonStack.topAnchor.constraint(equalTo: OTPView.bottomAnchor, constant: 24),
            labelButtonStack.heightAnchor.constraint(equalToConstant: 20),
            labelButtonStack.centerXAnchor.constraint(equalTo: OTPView.centerXAnchor)
        ])
    }
    
    private func setUpContinueButton(){
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: labelButtonStack.bottomAnchor, constant: 43),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            continueButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
