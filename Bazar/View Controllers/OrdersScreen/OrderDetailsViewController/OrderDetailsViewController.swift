//
//  OrderDetailsViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class OrderDetailsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let paymentsArr: [[String: String]] = [["qty":"1x","lbl":"Squid Sweet and Sour Salad","price":"$19.99"],["qty":"1x","lbl":"The Da vinci Code","price":"$39.99"],["qty":"1x","lbl":"Arcu ipsum feugiat leo odio ","price":"$27.12"],]
    
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
    
    let thankyouView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let thanksLbl: UILabel = {
        let label = UILabel()
        label.text = "Thankyou 👋"
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loremLbl: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit"
        label.numberOfLines = 0
        label.font = .appFont(.openSansBold, size: 24)
        label.textColor = .appColor(.purple)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let orderLbl: UILabel = {
        let label = UILabel()
        label.text = "Order #2930541"
        label.font = .appFont(.robotoRegular, size: 14)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelButtonStack: UIStackView = {
        let label = UILabel()
        label.text = "Do you want to cancel your order?"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    private let paymentLbl: UILabel = {
        let label = UILabel()
        label.text = "Order Details"
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let paymentDetailsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paymentTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OrderDetailsTableViewCell.self, forCellReuseIdentifier: "OrderDetailsTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let paymentLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subTotalPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Subtotal"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let subTotalPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$87.10"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let subTotalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shippingPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shipping"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let shippingPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$2"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let shippingLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let totalPaymentLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Payment"
        label.font = UIFont.appFont(.RobotoBold, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let totalPaymentValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$89.12"
        label.font = UIFont.appFont(.RobotoBold, size: 14)
        label.textColor = UIColor.appColor(.purple)
        return label
    }()
    
    
    private let deliveryInLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Delivery in"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let  deliveryInValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 - 15 mins"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    
    private let timeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let  timeValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15.24 - 15.39"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    
    private let orderStatusBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.lightGrey)
        button.setTitle("Order Status", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        
        orderStatusBtn.addTarget(self, action: #selector(orderStatusBtnPressed), for: .touchUpInside)
        setUp()
    }
    
    private func setUp(){
        setupScrollView()
        setUpThankYouView()
        
        setUpPaymentLbl()
        
        setUpOrderStatusBtn()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
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
    
    private func setUpThankYouView(){
        
        scrollContainer.addSubview(thankyouView)
        thankyouView.addSubview(thanksLbl)
        thankyouView.addSubview(loremLbl)
        thankyouView.addSubview(orderLbl)
        scrollContainer.addSubview(labelButtonStack)
        
        NSLayoutConstraint.activate([
            thankyouView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 24),
            thankyouView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            thankyouView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            
            thanksLbl.topAnchor.constraint(equalTo: thankyouView.topAnchor, constant: 24),
            thanksLbl.centerXAnchor.constraint(equalTo: thankyouView.centerXAnchor),
            
            loremLbl.topAnchor.constraint(equalTo: thanksLbl.bottomAnchor, constant: 4),
            loremLbl.centerXAnchor.constraint(equalTo: thankyouView.centerXAnchor),
            
            orderLbl.topAnchor.constraint(equalTo: loremLbl.bottomAnchor, constant: 16),
            orderLbl.centerXAnchor.constraint(equalTo: loremLbl.centerXAnchor),
            orderLbl.bottomAnchor.constraint(equalTo: thankyouView.bottomAnchor, constant: -16),

            labelButtonStack.topAnchor.constraint(equalTo: thankyouView.bottomAnchor, constant: 16),
            labelButtonStack.heightAnchor.constraint(equalToConstant: 20),
            labelButtonStack.centerXAnchor.constraint(equalTo: thankyouView.centerXAnchor)
             
        ])
        
    }
    
    private func setUpPaymentLbl(){
        scrollContainer.addSubview(paymentLbl)
        scrollContainer.addSubview(paymentDetailsView)
        paymentDetailsView.addSubview(paymentTableView)
        paymentDetailsView.addSubview(paymentLineView)
        paymentDetailsView.addSubview(subTotalPriceLbl)
        paymentDetailsView.addSubview(subTotalPriceValue)
        paymentDetailsView.addSubview(subTotalLineView)
        paymentDetailsView.addSubview(shippingPriceLbl)
        paymentDetailsView.addSubview(shippingPriceValue)
        paymentDetailsView.addSubview(shippingLineView)
        paymentDetailsView.addSubview(totalPaymentLbl)
        paymentDetailsView.addSubview(totalPaymentValue)
        paymentDetailsView.addSubview(deliveryInLbl)
        paymentDetailsView.addSubview(deliveryInValue)
        paymentDetailsView.addSubview(timeLbl)
        paymentDetailsView.addSubview(timeValue)
        
        NSLayoutConstraint.activate([
            paymentLbl.topAnchor.constraint(equalTo: labelButtonStack.bottomAnchor, constant: 24),
            paymentLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            
            paymentDetailsView.topAnchor.constraint(equalTo: paymentLbl.bottomAnchor, constant: 16),
            paymentDetailsView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            paymentDetailsView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
        
            paymentTableView.topAnchor.constraint(equalTo: paymentDetailsView.topAnchor, constant: 16),
            paymentTableView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor,constant: 16),
            paymentTableView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor,constant: -16),
            paymentTableView.heightAnchor.constraint(equalToConstant: 92),
            
            paymentLineView.topAnchor.constraint(equalTo: paymentTableView.bottomAnchor, constant: 16),
            paymentLineView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            paymentLineView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            paymentLineView.heightAnchor.constraint(equalToConstant: 1),
            
            subTotalPriceLbl.topAnchor.constraint(equalTo: paymentLineView.bottomAnchor, constant: 16),
            subTotalPriceLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            
            subTotalPriceValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            subTotalPriceValue.centerYAnchor.constraint(equalTo: subTotalPriceLbl.centerYAnchor),
            
            
            subTotalLineView.topAnchor.constraint(equalTo: subTotalPriceLbl.bottomAnchor, constant: 16),
            subTotalLineView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            subTotalLineView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            subTotalLineView.heightAnchor.constraint(equalToConstant: 1),
            
            shippingPriceLbl.topAnchor.constraint(equalTo: subTotalLineView.bottomAnchor, constant: 16),
            shippingPriceLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            
            shippingPriceValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            shippingPriceValue.centerYAnchor.constraint(equalTo: shippingPriceLbl.centerYAnchor),
            
            shippingLineView.topAnchor.constraint(equalTo: shippingPriceLbl.bottomAnchor, constant: 16),
            shippingLineView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            shippingLineView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            shippingLineView.heightAnchor.constraint(equalToConstant: 1),
            
            totalPaymentLbl.topAnchor.constraint(equalTo: shippingLineView.bottomAnchor, constant: 16),
            totalPaymentLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            totalPaymentLbl.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),

            totalPaymentValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            totalPaymentValue.centerYAnchor.constraint(equalTo: totalPaymentLbl.centerYAnchor),
            
            deliveryInLbl.topAnchor.constraint(equalTo: totalPaymentLbl.bottomAnchor, constant: 16),
            deliveryInLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            
            
            deliveryInValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            deliveryInValue.centerYAnchor.constraint(equalTo: deliveryInLbl.centerYAnchor),
            
            timeLbl.topAnchor.constraint(equalTo: deliveryInLbl.bottomAnchor, constant: 8),
            timeLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            timeLbl.bottomAnchor.constraint(equalTo: paymentDetailsView.bottomAnchor, constant: -16),
            
            
            timeValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            timeValue.centerYAnchor.constraint(equalTo: timeLbl.centerYAnchor),
        ])
    }
    
    
    private func setUpOrderStatusBtn(){
        scrollContainer.addSubview(orderStatusBtn)
        NSLayoutConstraint.activate([
            orderStatusBtn.topAnchor.constraint(equalTo: paymentDetailsView.bottomAnchor, constant: 78),
            orderStatusBtn.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            orderStatusBtn.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            orderStatusBtn.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: -20),
            orderStatusBtn.heightAnchor.constraint(equalToConstant: 48),
            
        ])
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTableViewCell", for: indexPath) as! OrderDetailsTableViewCell
        cell.qtyLabel.text = paymentsArr[indexPath.row]["qty"]
        cell.titleLabel.text = paymentsArr[indexPath.row]["lbl"]
        cell.priceLabel.text = paymentsArr[indexPath.row]["price"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    
    @objc func orderStatusBtnPressed(){
        let orderVC = OrderStatusViewController()
        navigationController?.pushViewController(orderVC, animated: true)
    }
}

