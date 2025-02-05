//
//  PaymentViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 01/02/2025.
//

import UIKit

class PaymentViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
        
    var dismissHandler: (() -> Void)?
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           var touch: UITouch? = touches.first
           dismissHandler?()
           if touch?.view == self.view {
               self.dismiss(animated: true)
           }
           
       }
    
    let paymentsArr: [[String: String]] = [["img":"payment1", "label":"KNET"],["img":"payment2", "label":"Credit Card"],["img":"payment1", "label":"KNET"],["img":"payment2", "label":"Credit Card"],]
    
    private var selectedIndexPath: IndexPath?
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

    private let paymentLbl: UILabel = {
        let label = UILabel()
        label.text = "Your Payments"
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let paymentTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PaymentTableViewCell.self, forCellReuseIdentifier: "PaymentTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        setUpNotificationTableView()
    }

    private func  setUpPaymentView(){
        
        view.addSubview(paymentView)
        paymentView.addSubview(lineView)
        paymentView.addSubview(paymentLbl)
        
        NSLayoutConstraint.activate([
            paymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
          
            
            lineView.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: paymentView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            
            paymentLbl.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            paymentLbl.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24)
        ])
    }
    
    
    private func setUpNotificationTableView() {
        paymentView.addSubview(paymentTableView)

        NSLayoutConstraint.activate([
            paymentTableView.topAnchor.constraint(equalTo: paymentLbl.bottomAnchor, constant: 16),
            paymentTableView.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 24),
            paymentTableView.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -24),
            paymentTableView.bottomAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: 0),
            paymentTableView.heightAnchor.constraint(equalToConstant: 289)
        ])
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
        cell.iconImageView.image = UIImage(named: paymentsArr[indexPath.row]["img"] ?? "")
        cell.titleLabel.text = paymentsArr[indexPath.row]["label"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    
}




