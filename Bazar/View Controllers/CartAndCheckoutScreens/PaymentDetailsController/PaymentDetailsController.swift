//
//  PaymentDetailsController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class PaymentDetailsController: UIViewController {
    
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

    private let addressView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
            paymentView.heightAnchor.constraint(equalToConstant: 373),
          
            
            lineView.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: paymentView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            
            paymentDetailsLbl.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            paymentDetailsLbl.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpAddressView(){
        paymentView.addSubview(addressView)
        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: paymentDetailsLbl.bottomAnchor, constant: 16),
            addressView.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24),
            addressView.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -24),
            addressView.heightAnchor.constraint(equalToConstant: 236)
        ])
    }

}
