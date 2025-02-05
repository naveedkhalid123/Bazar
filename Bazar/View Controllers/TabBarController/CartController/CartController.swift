//
//  CartController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class CartController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cartArr = [["img":"fvt1","desc":"In in amet ultrices sit.","price":"$19.99"],["img":"fvt2","desc":"Bibendum facilisis.","price":"$27.12"],["img":"fvt3","desc":"Nulla et diam cras.","price":"$13.52"],["img":"fvt4","desc":"Risus malesuada in.","price":"$19.99"],]
    
    
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
        view.isHidden = true
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
    
    
    // Cart Table View
    
    
    private let cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouritesTableViewCell.self, forCellReuseIdentifier: "FavouritesTableViewCell")
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let confirmOrdderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Confirm Order", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        notificationButton.addTarget(self, action: #selector(notifyBtnPressed), for: .touchUpInside)
        confirmOrdderButton.addTarget(self, action: #selector(confirmOrderBtnPressed), for: .touchUpInside)
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        setUp()
    }
    private func setUp(){
        setUpHeaderView()
        setUpHomeLbl()
        setUpNotificationButton()
        
        setUpCartView()
        setUpCartImage()
        setUpProductLabel()
        
        setUpNotificationTableView()
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
    
    @objc func notifyBtnPressed(){
        let notifyVC = NotificationViewController()
        notifyVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(notifyVC, animated: true)
    }
    
    private func setUpNotificationTableView(){
        view.addSubview(cartTableView)
        NSLayoutConstraint.activate([
            cartTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            cartTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            cartTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cartTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func setUpContinueButton(){
        view.addSubview(confirmOrdderButton)
        NSLayoutConstraint.activate([
            confirmOrdderButton.topAnchor.constraint(equalTo: cartTableView.bottomAnchor, constant: 40),
            confirmOrdderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            confirmOrdderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
           // saveButtonButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            confirmOrdderButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartArr.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
        cell.favouriteImageView.image = UIImage(named: cartArr[indexPath.row]["img"] ?? "")
        cell.fvtDes.text = cartArr[indexPath.row]["desc"]
        cell.priceLbl.text = cartArr[indexPath.row]["price"]
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    @objc func confirmOrderBtnPressed(){
        let confirmOrderVC = ConfirmOrderController()
        confirmOrderVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(confirmOrderVC, animated: true)
    }

}
