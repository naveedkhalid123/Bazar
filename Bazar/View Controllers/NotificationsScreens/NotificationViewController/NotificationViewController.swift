//
//  NotificationViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 01/02/2025.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let notificationArr: [[String: String]] = [
        ["title": "Promotion", "date": "Oct 21 • 08.00", "message": "Today 50% discount on all Books in Novel category with online orders worldwide."],
        ["title": "New Arrivals", "date": "Nov 10 • 14.30", "message": "Check out our latest collection of best-selling books!"],
        ["title": "Limited Offer", "date": "Dec 5 • 12.00", "message": "Get free shipping on all orders above $50 for this weekend only!"],
        ["title": "Reminder", "date": "Jan 1 • 09.00", "message": "Your wishlist items are back in stock. Grab them before they sell out!"]
    ]

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
    
    
    //  cart view 
    
    private let cartView: UIView = {
        let view = UIView()
        view.isHidden = true
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
    
    
    private let notificationTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "NotificationTableViewCell")
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
       // tableView.isHidden = true
        tableView.allowsSelection = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        
        // Cart View
        setUpCartView()
        setUpCartImage()
        setUpProductLabel()
        
        // Notification Table view
        setUpNotificationTableView()
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
    
    
    
    
    // Cart View
    
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
    
    private func setUpNotificationTableView(){
        view.addSubview(notificationTableView)
        NSLayoutConstraint.activate([
            notificationTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 42),
            notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            notificationTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        
        let notification = notificationArr[indexPath.row]
        let title = notification["title"] ?? ""
        let date = notification["date"] ?? ""
        let message = notification["message"] ?? ""
        
        cell.configure(title: title, date: date, message: message)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.selectionStyle = .none
        }
    
        let authorsInnerPageVC = PromotionViewController()
        self.navigationController?.pushViewController(authorsInnerPageVC, animated: true)
    }
    
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }

    
}
