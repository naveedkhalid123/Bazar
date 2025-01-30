//
//  OrderStatusViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class OrderStatusViewController: UIViewController {

    private let centerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let successImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "successImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let successLabel: UILabel = {
        let label = UILabel()
        label.text = "You Received The Order!!"
        label.textColor = .appColor(.black)
        label.font = .appFont(.RobotoBold, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let orderNumLbl: UILabel = {
        let label = UILabel()
        label.text = "Order #2930541"
        label.textColor = .appColor(.grey)
        label.font = .appFont(.robotoRegular, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let feedbackView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private let feedbackLbl: UILabel = {
        let label = UILabel()
        label.text = "Tell us your feedback 🙌"
        label.textColor = .appColor(.purple)
        label.font = .appFont(.RobotoBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let feedbackDesc: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet consectetur. Dignissim magna vitae."
        label.textColor = .appColor(.purple)
        label.font = .appFont(.RobotoLight, size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let writeSomethingLbl: UILabel = {
        let label = UILabel()
        label.text = "Write something for us!"
        label.textColor = .appColor(.black)
        label.font = .appFont(.robotoRegular, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }

    private func setUp(){
        setUpCenterView()
        setUpSuccessImageView()
        setUpSuccessLabel()
        setUpOrderNumLbl()

        setUpFeedbackView()
        setUPFeedbackLbl()
        setUpFeedbackDesc()
        
        setUpStarsStackView()
        setUpWriteSomethingLbl()

        setUpDoneButton()
    }

    private func setUpCenterView() {
        view.addSubview(centerView)
        NSLayoutConstraint.activate([
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           // centerView.heightAnchor.constraint(equalToConstant: 507),
            centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }


    private func setUpSuccessImageView(){
        centerView.addSubview(successImageView)
        NSLayoutConstraint.activate([
            successImageView.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 0),
            successImageView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            successImageView.widthAnchor.constraint(equalToConstant: 160),
            successImageView.heightAnchor.constraint(equalToConstant: 91)
        ])
    }


    private func setUpSuccessLabel(){
        centerView.addSubview(successLabel)
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 24),
            successLabel.centerXAnchor.constraint(equalTo: successImageView.centerXAnchor)
        ])
    }

    private func setUpOrderNumLbl(){
        centerView.addSubview(orderNumLbl)
        NSLayoutConstraint.activate([
            orderNumLbl.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 8),
            orderNumLbl.centerXAnchor.constraint(equalTo: successLabel.centerXAnchor)
        ])
    }

    private func setUpFeedbackView(){
        centerView.addSubview(feedbackView)
        NSLayoutConstraint.activate([
            feedbackView.topAnchor.constraint(equalTo: orderNumLbl.bottomAnchor, constant: 24),
            feedbackView.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 0),
            feedbackView.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: 0),
            feedbackView.heightAnchor.constraint(equalToConstant: 232)
        ])
    }

    private func setUPFeedbackLbl(){
        feedbackView.addSubview(feedbackLbl)
        NSLayoutConstraint.activate([
            feedbackLbl.topAnchor.constraint(equalTo: feedbackView.topAnchor, constant: 24),
            feedbackLbl.centerXAnchor.constraint(equalTo: feedbackView.centerXAnchor)
        ])
    }

    private func setUpFeedbackDesc(){
        feedbackView.addSubview(feedbackDesc)
        NSLayoutConstraint.activate([
            feedbackDesc.topAnchor.constraint(equalTo: feedbackLbl.bottomAnchor, constant: 8),
            feedbackDesc.centerXAnchor.constraint(equalTo: feedbackLbl.centerXAnchor),
            feedbackDesc.leadingAnchor.constraint(equalTo: feedbackView.leadingAnchor, constant: 24),
            feedbackDesc.trailingAnchor.constraint(equalTo: feedbackView.trailingAnchor, constant: -24),
        ])
    }
    
    
    private func setUpStarsStackView() {
        for _ in 1...5 {
            let starImageView = UIImageView()
            starImageView.image = UIImage(named: "fillStar")
            starImageView.contentMode = .scaleAspectFit
            starImageView.translatesAutoresizingMaskIntoConstraints = false
            starsStackView.addArrangedSubview(starImageView)
        }

        feedbackView.addSubview(starsStackView)
        NSLayoutConstraint.activate([
            starsStackView.topAnchor.constraint(equalTo: feedbackDesc.bottomAnchor, constant: 24),
            starsStackView.centerXAnchor.constraint(equalTo: feedbackView.centerXAnchor),
            starsStackView.heightAnchor.constraint(equalToConstant: 24),
            starsStackView.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    
    private func setUpWriteSomethingLbl(){
        feedbackView.addSubview(writeSomethingLbl)
        NSLayoutConstraint.activate([
            writeSomethingLbl.topAnchor.constraint(equalTo: starsStackView.bottomAnchor, constant: 24),
            writeSomethingLbl.centerXAnchor.constraint(equalTo: starsStackView.centerXAnchor),
            writeSomethingLbl.bottomAnchor.constraint(equalTo: feedbackView.bottomAnchor, constant: -24)
        ])
    }
    
    
    private func setUpDoneButton(){
        centerView.addSubview(doneButton)
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: feedbackView.bottomAnchor, constant: 24),
            doneButton.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 0),
            doneButton.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: 0),
            doneButton.heightAnchor.constraint(equalToConstant: 48),
            doneButton.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: 0),
        ])
    }

}


