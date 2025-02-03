//
//  EmptyNorificationController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class EmptyNorificationController: UIViewController {
    
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
    
    
    private let notificationLbl: UILabel = {
        let label = UILabel()
        label.text = "Notification"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "notificationImg")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "There is no notifications"
        label.font = .appFont(.RobotoMedium, size: 18)
        label.textColor = .appColor(.black)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        
        setUpCartView()
        setUpCartImage()
        setUpProductLabel()
    }
    
    private func setUpHeaderView() {
        view.addSubview(headerView)
        headerView.addSubview(backButton)
        headerView.addSubview(notificationLbl)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            notificationLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            notificationLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
        ])
    }
    
    private func setUpCartView() {
        view.addSubview(cartView)
        NSLayoutConstraint.activate([
            cartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 97),
            cartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -97),
            cartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func setUpCartImage(){
        cartView.addSubview(cartImage)
        NSLayoutConstraint.activate([
            cartImage.topAnchor.constraint(equalTo: cartView.topAnchor, constant: 0),
            cartImage.centerXAnchor.constraint(equalTo: cartView.centerXAnchor),
        ])
    }
    
    private func setUpProductLabel(){
        cartView.addSubview(productLabel)
        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: cartImage.bottomAnchor, constant: 24),
            productLabel.centerXAnchor.constraint(equalTo: cartImage.centerXAnchor),
            productLabel.bottomAnchor.constraint(equalTo: cartView.bottomAnchor, constant: 0)
        ])
    }
    
}
