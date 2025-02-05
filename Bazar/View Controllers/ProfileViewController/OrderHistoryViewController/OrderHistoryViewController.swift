//
//  OrderHistoryViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 31/01/2025.
//

import UIKit

//checked
class OrderHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum Constant {
        static let backButtonImage: String = "backArrow"
        static let orderHistoryLabel: String = "Order History"
        static let orderHistoryLabelFont: UIFont = UIFont.appFont(.openSansBold, size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        static let orderHistoryLabelColor: UIColor = UIColor.appColor(.black)!
    }
    
    var orderHistoryArr = [["img":"fvt1","desc":"In in amet ultrices sit","status":"Delivered","count":"1 items"],["img":"fvt2","desc":"Carrie Fisher","status":"Delivered","count":"5 items"],["img":"fvt3","desc":"The Waiting","status":"Delivered","count":"3 items"]]
    
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constant.backButtonImage), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let orderHistoryLbl: UILabel = {
        let label = UILabel()
        label.text = Constant.orderHistoryLabel
        label.font = Constant.orderHistoryLabelFont
        label.textColor = Constant.orderHistoryLabelColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = .zero
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let scrollContainer: UIView = {
        let view = UIView()
        return view
    }()
    
  
    private let orderHistoryTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(OrderHistoryTabelViewCell.self, forCellReuseIdentifier: "OrderHistoryTabelViewCell")
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorColor = UIColor.appColor(.lineView)
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
        
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        
        orderHistoryTableView.delegate = self
        orderHistoryTableView.dataSource = self
        orderHistoryTableView.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        orderHistoryTableView.layer.borderWidth = 1.0
        orderHistoryTableView.layer.cornerRadius = 8.0
        
        
        
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpOrderHistoryLbl()
        
        setupScrollView()
        setUpFavouritesTableView()
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
    
    private func setUpbackButton(){
        headerView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpOrderHistoryLbl(){
        headerView.addSubview(orderHistoryLbl)
        NSLayoutConstraint.activate([
            orderHistoryLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            orderHistoryLbl.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
    }
    

    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }

    
    private func setUpFavouritesTableView(){
        scrollContainer.addSubview(orderHistoryTableView)
        NSLayoutConstraint.activate([
            orderHistoryTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            orderHistoryTableView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            orderHistoryTableView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            orderHistoryTableView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            orderHistoryTableView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderHistoryArr.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryTabelViewCell", for: indexPath) as! OrderHistoryTabelViewCell
        cell.itemImageView.image = UIImage(named: orderHistoryArr[indexPath.row]["img"] ?? "")
        cell.titleLabel.text = orderHistoryArr[indexPath.row]["desc"]
        cell.statusLabel.text  = orderHistoryArr[indexPath.row]["status"]
        cell.itemCountLabel.text = orderHistoryArr[indexPath.row]["count"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
}


