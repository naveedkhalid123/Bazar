//
//  LogoutViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class LogoutViewController: UIViewController {
    
    private let logoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineView")
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Logout"
        label.font = .appFont(.RobotoBold, size: 18)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoutDesc: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.black)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.lightGrey)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal) 
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
    }
    
    private func setUp(){
        setUplogoutView()
        setUpLineView()
        
        setUpLogoutLabel()
        setUpLogoutDesc()
        setUpLogoutButton()
        setUpCancelButton()
    }
    
    private func setUplogoutView(){
        view.addSubview(logoutView)
        NSLayoutConstraint.activate([
            logoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            logoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            logoutView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    private func setUpLineView(){
        logoutView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: logoutView.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: logoutView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    private func setUpLogoutLabel(){
        logoutView.addSubview(logoutLabel)
        NSLayoutConstraint.activate([
            logoutLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            logoutLabel.leadingAnchor.constraint(equalTo: logoutView.leadingAnchor, constant: 24)
        ])
    }
    
    
    private func setUpLogoutDesc(){
        logoutView.addSubview(logoutDesc)
        NSLayoutConstraint.activate([
            logoutDesc.topAnchor.constraint(equalTo: logoutLabel.bottomAnchor, constant: 16),
            logoutDesc.leadingAnchor.constraint(equalTo: logoutView.leadingAnchor, constant: 24),
            logoutDesc.trailingAnchor.constraint(equalTo: logoutView.trailingAnchor, constant: -24)
        ])
    }
    
    private func setUpLogoutButton(){
        logoutView.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: logoutDesc.bottomAnchor, constant: 24),
            logoutButton.leadingAnchor.constraint(equalTo: logoutView.leadingAnchor, constant: 24),
            logoutButton.trailingAnchor.constraint(equalTo: logoutView.trailingAnchor, constant: -24),
            logoutButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setUpCancelButton(){
        logoutView.addSubview(cancelButton)
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 16),
            cancelButton.leadingAnchor.constraint(equalTo: logoutView.leadingAnchor, constant: 24),
            cancelButton.trailingAnchor.constraint(equalTo: logoutView.trailingAnchor, constant: -24),
            cancelButton.bottomAnchor.constraint(equalTo: logoutView.bottomAnchor, constant: -48),
            cancelButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
