//
//  PaymentDetailsController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class PaymentDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
        
    var dismissHandler: (() -> Void)?
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           var touch: UITouch? = touches.first
           dismissHandler?()
           if touch?.view == self.view {
               self.dismiss(animated: true)
           }
           
       }
    
    let paymentsArr: [[String: String]] = [["lbl":"Squid Sweet and Sour Salad","price":"$19.99"],["lbl":"Japan Hainanese Sashimi","price":"$39.99"],["lbl":"Black Pepper Beef Lumpia","price":"$27.12"],]
    
    private let paymentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let paymentDetailsLbl: UILabel = {
        let label = UILabel()
        label.text = "Payment Details"
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
    
    private let summaryPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let summaryPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$32.43"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let paymentTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PaymentDetailsCell.self, forCellReuseIdentifier: "PaymentDetailsCell")
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
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let totalPaymentValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$89.12"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appColor(.black)?.withAlphaComponent(0.3)
        
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        setUp()
    }
    private func setUp(){
        
        setUpPaymentView()
        setUpAddressView()
    }
    
    private func  setUpPaymentView(){
        
        view.addSubview(paymentView)
        paymentView.addSubview(lineView)
        paymentView.addSubview(paymentDetailsLbl)
        
        NSLayoutConstraint.activate([
            paymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
         
            lineView.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: paymentView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            
            paymentDetailsLbl.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            paymentDetailsLbl.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpAddressView(){
        
        paymentView.addSubview(paymentDetailsView)
        paymentDetailsView.addSubview(summaryPriceLbl)
        paymentDetailsView.addSubview(summaryPriceValue)
        paymentDetailsView.addSubview(paymentTableView)
        paymentDetailsView.addSubview(paymentLineView)
        paymentDetailsView.addSubview(shippingPriceLbl)
        paymentDetailsView.addSubview(shippingPriceValue)
        paymentDetailsView.addSubview(shippingLineView)
        paymentDetailsView.addSubview(totalPaymentLbl)
        paymentDetailsView.addSubview(totalPaymentValue)
        
        NSLayoutConstraint.activate([
            paymentDetailsView.topAnchor.constraint(equalTo: paymentDetailsLbl.bottomAnchor, constant: 16),
            paymentDetailsView.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24),
            paymentDetailsView.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -24),
            paymentDetailsView.bottomAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: -60),
        
            summaryPriceLbl.topAnchor.constraint(equalTo: paymentDetailsView.topAnchor, constant: 16),
            summaryPriceLbl.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
        
            summaryPriceValue.centerYAnchor.constraint(equalTo: summaryPriceLbl.centerYAnchor),
            summaryPriceValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            
            paymentTableView.topAnchor.constraint(equalTo: summaryPriceLbl.bottomAnchor, constant: 16),
            paymentTableView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            paymentTableView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            paymentTableView.heightAnchor.constraint(equalToConstant: 64),
            
            
            paymentLineView.topAnchor.constraint(equalTo: paymentTableView.bottomAnchor, constant: 16),
            paymentLineView.leadingAnchor.constraint(equalTo: paymentDetailsView.leadingAnchor, constant: 16),
            paymentLineView.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            paymentLineView.heightAnchor.constraint(equalToConstant: 1),
            
            shippingPriceLbl.topAnchor.constraint(equalTo: paymentLineView.bottomAnchor, constant: 16),
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
            totalPaymentLbl.bottomAnchor.constraint(equalTo: paymentDetailsView.bottomAnchor, constant: -16),
            
            totalPaymentValue.trailingAnchor.constraint(equalTo: paymentDetailsView.trailingAnchor, constant: -16),
            totalPaymentValue.centerYAnchor.constraint(equalTo: totalPaymentLbl.centerYAnchor),

        ])
    }

    
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentDetailsCell", for: indexPath) as! PaymentDetailsCell
        cell.titleLabel.text = paymentsArr[indexPath.row]["lbl"]
        cell.priceLabel.text = paymentsArr[indexPath.row]["price"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}
