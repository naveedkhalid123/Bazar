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
    
    private let notificationTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "NotificationTableViewCell")
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

    
}
