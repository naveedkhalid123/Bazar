//
//  SuccessVerification.swift
//  Bazar
//
//  Created by Naveed Khalid on 25/01/2025.
//


import UIKit

class SuccessVerification: UIViewController {
    
    private let successView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
    }()
    
    let successImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "successImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let successLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Congratulation!"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "your account is complete, please enjoy the best menu from us."
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Get Started", for: .normal)
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
        setUpSuccessView()
        setUpSuccessImage()
        setUpSuccessLbl()
        setUpSubHead()
        setUpLoginButton()
    }
    
    private func setUpSuccessView(){
        view.addSubview(successView)
        NSLayoutConstraint.activate([
            successView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            successView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            successView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            successView.heightAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    private func setUpSuccessImage(){
        successView.addSubview(successImage)
        NSLayoutConstraint.activate([
            successImage.topAnchor.constraint(equalTo: successView.topAnchor, constant: 0),
            successImage.centerXAnchor.constraint(equalTo: successView.centerXAnchor),
//            successImage.widthAnchor.constraint(equalToConstant: 90),
//            successImage.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
    
    private func setUpSuccessLbl(){
        successView.addSubview(successLbl)
        NSLayoutConstraint.activate([
            successLbl.topAnchor.constraint(equalTo: successImage.bottomAnchor, constant: 40),
            successLbl.centerXAnchor.constraint(equalTo: successImage.centerXAnchor)
        ])
    }
    
    private func setUpSubHead(){
        successView.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.topAnchor.constraint(equalTo: successLbl.bottomAnchor, constant: 8),
            subHead.leadingAnchor.constraint(equalTo: successView.leadingAnchor, constant: 24),
            subHead.trailingAnchor.constraint(equalTo: successView.trailingAnchor, constant: -24),
            subHead.centerXAnchor.constraint(equalTo: successLbl.centerXAnchor)
        ])
    }
    
    
    private func setUpLoginButton(){
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: successView.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }


}
