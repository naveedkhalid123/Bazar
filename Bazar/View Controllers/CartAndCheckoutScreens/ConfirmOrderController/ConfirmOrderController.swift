//
//  ConfirmOrderController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class ConfirmOrderController: UIViewController {
    
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
    
    
    private let confirmOrderLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirm Order"
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
    
    
    private let addressView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addressLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address"
        label.font = UIFont.appFont(.openSansBold, size: 18)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let streatLocationBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "streatLocation"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    private let streatAddressLbl: UILabel = {
        let label = UILabel()
        label.text = "Utama Street No.20"
        label.font = UIFont.appFont(.RobotoBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressDes: UILabel = {
        let label = UILabel()
        label.text = "State Street No.15, New York 10001, United States"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change", for: .normal)
        button.backgroundColor = UIColor.appColor(.lightGrey)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = .appFont(.RobotoBold, size: 14)
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let nextBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackNext"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let summaryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let summaryLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Summary"
        label.font = UIFont.appFont(.openSansBold, size: 18)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let summaryPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let summaryPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$32.43"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let shippingPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shipping"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let shippingPriceValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$2"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    
    private let summaryLineView: UIView = {
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
    
    private let paymentLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seeDetailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let seeDetailsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "See Details"
        label.font = UIFont.appFont(.RobotoBold, size: 14)
        label.textColor = UIColor.appColor(.purple)
        return label
    }()
    
    private let seeDetailsImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "purpleNext")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let seeDetailsButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dateAndTimeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateTimeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date and Time"
        label.font = UIFont.appFont(.openSansBold, size: 18)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    
    private let dateTimeBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dateImage"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let dateLbl: UILabel = {
        let label = UILabel()
        label.text = "Date & time"
        label.font = UIFont.appFont(.RobotoBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateTimeDes: UILabel = {
        let label = UILabel()
        label.text = "Choose date and time "
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectDateBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackNext"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let paymentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let paymentLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Payment"
        label.font = UIFont.appFont(.openSansBold, size: 18)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    
    private let paymentBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "paymentImage"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let paymentHeadLbl: UILabel = {
        let label = UILabel()
        label.text = "Payment"
        label.font = UIFont.appFont(.RobotoBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paymentDes: UILabel = {
        let label = UILabel()
        label.text = "Choose your payment"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectPaymnetBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "blackNext"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Order", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        seeDetailsButton.addTarget(self, action: #selector(seeDetailsButtonTapped), for: .touchUpInside)
        selectDateBtn.addTarget(self, action: #selector(selectDateBtnTapped), for: .touchUpInside)
        selectPaymnetBtn.addTarget(self, action: #selector(selectPaymentTapped), for: .touchUpInside)
        
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setupScrollView()
        
        setUpAddressView()
        setUpSummaryView()
        setUpDateAndTimeView()
        
        setUpPaymentView()
        
        setUpOrderButton()
    
    }
    
    private func setUpHeaderView() {
        
        view.addSubview(headerView)
        headerView.addSubview(backButton)
        headerView.addSubview(confirmOrderLbl)
        headerView.addSubview(notificationButton)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            confirmOrderLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            confirmOrderLbl.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            notificationButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            notificationButton.centerYAnchor.constraint(equalTo: confirmOrderLbl.centerYAnchor)
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
    
    func setUpAddressView() {
       
        scrollContainer.addSubview(addressView)
        addressView.addSubview(addressLbl)
        addressView.addSubview(streatLocationBtn)
        addressView.addSubview(streatAddressLbl)
        addressView.addSubview(addressDes)
        addressView.addSubview(changeButton)
        addressView.addSubview(nextBtn)

        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 20),
            addressView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            addressView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
        
            addressLbl.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 16),
            addressLbl.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 16),
            
            streatLocationBtn.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 10),
            streatLocationBtn.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 16),
            streatLocationBtn.widthAnchor.constraint(equalToConstant: 44),
            streatLocationBtn.heightAnchor.constraint(equalToConstant: 44),
            
            streatAddressLbl.topAnchor.constraint(equalTo: streatLocationBtn.topAnchor),
            streatAddressLbl.leadingAnchor.constraint(equalTo: streatLocationBtn.trailingAnchor, constant: 16),
            
            addressDes.topAnchor.constraint(equalTo: streatAddressLbl.bottomAnchor),
            addressDes.leadingAnchor.constraint(equalTo: streatLocationBtn.trailingAnchor, constant: 16),
            addressDes.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -16),
            
            changeButton.leadingAnchor.constraint(equalTo: addressDes.leadingAnchor),
            changeButton.topAnchor.constraint(equalTo: addressDes.bottomAnchor, constant: 16),
            changeButton.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -16),
            changeButton.heightAnchor.constraint(equalToConstant: 38),
            changeButton.widthAnchor.constraint(equalToConstant: 98),
            
            nextBtn.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -16),
            nextBtn.centerYAnchor.constraint(equalTo: addressDes.centerYAnchor),
            nextBtn.widthAnchor.constraint(equalToConstant: 24),
            nextBtn.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }


    private func setUpSummaryView(){
        scrollContainer.addSubview(summaryView)
        summaryView.addSubview(summaryLbl)
        summaryView.addSubview(summaryPriceLbl)
        summaryView.addSubview(summaryPriceValue)
        summaryView.addSubview(shippingPriceLbl)
        summaryView.addSubview(shippingPriceValue)
        summaryView.addSubview(summaryLineView)
        summaryView.addSubview(totalPaymentLbl)
        summaryView.addSubview(totalPaymentValue)
        summaryView.addSubview(paymentLineView)
        summaryView.addSubview(seeDetailsView)
        seeDetailsView.addSubview(seeDetailsLbl)
        seeDetailsView.addSubview(seeDetailsImg)
        seeDetailsView.addSubview(seeDetailsButton)
        
        NSLayoutConstraint.activate([
            summaryView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 16),
            summaryView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            summaryView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
        
            summaryLbl.topAnchor.constraint(equalTo: summaryView.topAnchor, constant: 16),
            summaryLbl.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            
            summaryPriceLbl.topAnchor.constraint(equalTo: summaryLbl.bottomAnchor, constant: 16),
            summaryPriceLbl.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            
            summaryPriceValue.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -16),
            summaryPriceValue.centerYAnchor.constraint(equalTo: summaryPriceLbl.centerYAnchor),
            
            shippingPriceLbl.topAnchor.constraint(equalTo: summaryPriceLbl.bottomAnchor, constant: 8),
            shippingPriceLbl.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            
            shippingPriceValue.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -16),
            shippingPriceValue.centerYAnchor.constraint(equalTo: shippingPriceLbl.centerYAnchor),
            
            summaryLineView.topAnchor.constraint(equalTo: shippingPriceLbl.bottomAnchor, constant: 16),
            summaryLineView.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            summaryLineView.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -16),
            summaryLineView.heightAnchor.constraint(equalToConstant: 1),
            
            totalPaymentLbl.topAnchor.constraint(equalTo: summaryLineView.bottomAnchor, constant: 16),
            totalPaymentLbl.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            totalPaymentLbl.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -16),
            
            totalPaymentValue.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -16),
            totalPaymentValue.centerYAnchor.constraint(equalTo: totalPaymentLbl.centerYAnchor),
            
            paymentLineView.topAnchor.constraint(equalTo: totalPaymentLbl.bottomAnchor, constant: 16),
            paymentLineView.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 0),
            paymentLineView.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: 0),
            paymentLineView.heightAnchor.constraint(equalToConstant: 1),
            
            seeDetailsView.topAnchor.constraint(equalTo: paymentLineView.bottomAnchor, constant: 16),
            seeDetailsView.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 16),
            seeDetailsView.bottomAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: -16),
            seeDetailsView.heightAnchor.constraint(equalToConstant: 20),
            seeDetailsView.widthAnchor.constraint(equalToConstant: 93),
            
            seeDetailsLbl.leadingAnchor.constraint(equalTo: seeDetailsView.leadingAnchor, constant: 0),
            seeDetailsLbl.topAnchor.constraint(equalTo: seeDetailsView.topAnchor, constant: 0),
            
            seeDetailsImg.trailingAnchor.constraint(equalTo: seeDetailsView.trailingAnchor, constant: 0),
            seeDetailsImg.centerYAnchor.constraint(equalTo: seeDetailsLbl.centerYAnchor),
            seeDetailsImg.leadingAnchor.constraint(equalTo: seeDetailsLbl.trailingAnchor, constant: 4),
            seeDetailsImg.widthAnchor.constraint(equalToConstant: 16),
            seeDetailsImg.heightAnchor.constraint(equalToConstant: 16),
            
            seeDetailsButton.leadingAnchor.constraint(equalTo: seeDetailsView.leadingAnchor, constant: 0),
            seeDetailsButton.trailingAnchor.constraint(equalTo: seeDetailsView.trailingAnchor, constant: 0),
            seeDetailsButton.topAnchor.constraint(equalTo: seeDetailsView.topAnchor, constant: 0),
            seeDetailsButton.bottomAnchor.constraint(equalTo: seeDetailsView.bottomAnchor, constant: 0),
        ])
    }
    
    
    private func setUpDateAndTimeView(){
        
        scrollContainer.addSubview(dateAndTimeView)
        dateAndTimeView.addSubview(dateTimeLbl)
        dateAndTimeView.addSubview(dateTimeBtn)
        dateAndTimeView.addSubview(dateLbl)
        dateAndTimeView.addSubview(dateTimeDes)
        dateAndTimeView.addSubview(selectDateBtn)
        
        NSLayoutConstraint.activate([
            dateAndTimeView.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: 16),
            dateAndTimeView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            dateAndTimeView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
          
            dateTimeLbl.topAnchor.constraint(equalTo: dateAndTimeView.topAnchor, constant: 16),
            dateTimeLbl.leadingAnchor.constraint(equalTo: dateAndTimeView.leadingAnchor, constant: 16),
            
            dateTimeBtn.topAnchor.constraint(equalTo: dateTimeLbl.bottomAnchor, constant: 16),
            dateTimeBtn.leadingAnchor.constraint(equalTo: dateAndTimeView.leadingAnchor, constant: 16),
            dateTimeBtn.widthAnchor.constraint(equalToConstant: 44),
            dateTimeBtn.heightAnchor.constraint(equalToConstant: 44),
            
            dateLbl.topAnchor.constraint(equalTo: dateTimeBtn.topAnchor),
            dateLbl.leadingAnchor.constraint(equalTo: dateTimeBtn.trailingAnchor, constant: 16),
            
            dateTimeDes.topAnchor.constraint(equalTo: dateLbl.bottomAnchor,constant: 4),
            dateTimeDes.leadingAnchor.constraint(equalTo: dateTimeBtn.trailingAnchor, constant: 16),
            dateTimeDes.bottomAnchor.constraint(equalTo: dateAndTimeView.bottomAnchor, constant: -16),
          
            
            selectDateBtn.trailingAnchor.constraint(equalTo: dateAndTimeView.trailingAnchor, constant: -16),
            selectDateBtn.centerYAnchor.constraint(equalTo: dateTimeDes.centerYAnchor),
            selectDateBtn.widthAnchor.constraint(equalToConstant: 24),
            selectDateBtn.heightAnchor.constraint(equalToConstant: 24)
            
        ])
       
    }
    
    
    private func setUpPaymentView(){
        
        scrollContainer.addSubview(paymentView)
        paymentView.addSubview(paymentLbl)
        paymentView.addSubview(paymentBtn)
        paymentView.addSubview(paymentHeadLbl)
        paymentView.addSubview(paymentDes)
        paymentView.addSubview(selectPaymnetBtn)
        
        NSLayoutConstraint.activate([
            paymentView.topAnchor.constraint(equalTo: dateAndTimeView.bottomAnchor, constant: 16),
            paymentView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            paymentView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
           
        
            paymentLbl.topAnchor.constraint(equalTo: paymentView.topAnchor, constant: 16),
            paymentLbl.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 16),
            
            paymentBtn.topAnchor.constraint(equalTo: paymentLbl.bottomAnchor, constant: 16),
            paymentBtn.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: 16),
            paymentBtn.widthAnchor.constraint(equalToConstant: 44),
            paymentBtn.heightAnchor.constraint(equalToConstant: 44),
            
            paymentHeadLbl.topAnchor.constraint(equalTo: paymentBtn.topAnchor),
            paymentHeadLbl.leadingAnchor.constraint(equalTo: paymentBtn.trailingAnchor, constant: 16),
            
            paymentDes.topAnchor.constraint(equalTo: paymentHeadLbl.bottomAnchor,constant: 4),
            paymentDes.leadingAnchor.constraint(equalTo: paymentBtn.trailingAnchor, constant: 16),
            paymentDes.bottomAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: -16),
          
            
            selectPaymnetBtn.trailingAnchor.constraint(equalTo: paymentView.trailingAnchor, constant: -16),
            selectPaymnetBtn.centerYAnchor.constraint(equalTo: paymentDes.centerYAnchor),
            selectPaymnetBtn.widthAnchor.constraint(equalToConstant: 24),
            selectPaymnetBtn.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setUpOrderButton(){
        scrollContainer.addSubview(orderButton)
        NSLayoutConstraint.activate([
            orderButton.topAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: 34),
            orderButton.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            orderButton.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            orderButton.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: -52),
            orderButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    @objc private func seeDetailsButtonTapped() {
        print("See Details button tapped!")
    }
    
    @objc private func selectDateBtnTapped() {
        print("Select Date button tapped!")
    }
    
    @objc private func selectPaymentTapped() {
        print("Select Date button tapped!")
    }

}
