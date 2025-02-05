//
//  HelpCenterViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class HelpCenterViewController: UIViewController {
    
    private let orderHistoryView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.purple)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "whiteBack"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let orderHistoryLbl: UILabel = {
        let label = UILabel()
        label.text = "Order History"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let helpCenterLbl: UILabel = {
        let label = UILabel()
        label.text = "Help Center"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let helpCenterDesc: UILabel = {
        let label = UILabel()
        label.text = """
             Tell us how we can help 👋
             Chapter are standing by for service & support!
        """
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
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
        imageView.image = UIImage(named: "purplePhone")
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        setUp()
    }
    
    private func setUp(){
        setUpOrderHistoryView()
        
        setUpHeaderView()
        setUpbackButton()
        setUpPromotionLbl()
        
        setUpHelpCenterLbl()
        setUpHelpCenterDesc()
        
        setUpStackView()
        
        setUpEmailImage()
        setUpEmailHead()
        setUpEmailSubHead()
        setUpEmailViewButton()
        
        setUpPhoneImage()
        setUpPhoneHead()
        setUpPhoneSubHead()
        setUpPhoneViewButton()
    }
    
    
    private func setUpOrderHistoryView() {
        view.addSubview(orderHistoryView)
        NSLayoutConstraint.activate([
            orderHistoryView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), 
            orderHistoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            orderHistoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            orderHistoryView.heightAnchor.constraint(equalToConstant: 252)
        ])
    }


    private func setUpHeaderView() {
        orderHistoryView.addSubview(headerView)
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
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpPromotionLbl(){
        headerView.addSubview(orderHistoryLbl)
        NSLayoutConstraint.activate([
            orderHistoryLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            orderHistoryLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }

    private func setUpHelpCenterLbl(){
        orderHistoryView.addSubview(helpCenterLbl)
        NSLayoutConstraint.activate([
            helpCenterLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14),
            helpCenterLbl.centerXAnchor.constraint(equalTo: orderHistoryView.centerXAnchor)
        ])
    }
    
    private func setUpHelpCenterDesc(){
        orderHistoryView.addSubview(helpCenterDesc)
        NSLayoutConstraint.activate([
            helpCenterDesc.topAnchor.constraint(equalTo: helpCenterLbl.bottomAnchor, constant: 8),
            helpCenterDesc.centerXAnchor.constraint(equalTo: helpCenterLbl.centerXAnchor),
            helpCenterDesc.leadingAnchor.constraint(equalTo: orderHistoryView.leadingAnchor, constant: 24),
            helpCenterDesc.trailingAnchor.constraint(equalTo: orderHistoryView.trailingAnchor, constant: -24),
          //  helpCenterDesc.centerYAnchor.constraint(equalTo: orderHistoryView.centerYAnchor)
        ])
    }
    
    
    private func setUpStackView() {
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(phoneView)
    
        view.addSubview(stackView)
    
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: orderHistoryView.bottomAnchor, constant: 16),
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

    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
    
}
