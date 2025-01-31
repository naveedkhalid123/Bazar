//
//  CartController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class CartController: UIViewController {
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let homeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Cart"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notify"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cartImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "There is no products"
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
        setUpHomeLbl()
        setUpNotificationButton()
        
        setUpCartView()
        setUpCartImage()
        setUpProductLabel()
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
    
    private func setUpHomeLbl(){
        headerView.addSubview(homeLbl)
        NSLayoutConstraint.activate([
            homeLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            homeLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpNotificationButton(){
        headerView.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            notificationButton.centerYAnchor.constraint(equalTo: homeLbl.centerYAnchor)
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
