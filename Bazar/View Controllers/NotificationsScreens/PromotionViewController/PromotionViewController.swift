//
//  PromotionViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class PromotionViewController: UIViewController {
    
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
    
    
    private let promotionLbl: UILabel = {
        let label = UILabel()
        label.text = "Promotion"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
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
    
    
    private let promotionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "promotionImg")
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let promotionHeadLbl: UILabel = {
        let label = UILabel()
        label.text = "Today 50% discount on all products in Chapter with online orders"
        label.font = .appFont(.RobotoBold, size: 18)
        label.textColor = .appColor(.black)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let promotionSubHeadLbl: UILabel = {
        let label = UILabel()
        label.text = """
        Excuse me… Who could ever resist a discount feast? 👀

        Hear me out. Today, October 21, 2021, Chapter has a 50% discount
        for any product. What are you waiting for, let's order now before it
        runs out.

        All of the products are discounted, just order through the Chapter
        app to enjoy this discount. From the best to the best we have
        prepared for you, may you always be happy when ordering at
        Chapter. Please choose the best product you want.

        So, what’s your call? Let’s roll, order your comfort food now 😉
        """
        label.font = .appFont(.robotoRegular, size: 14)
        label.textColor = .appColor(.grey)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpPromotionLbl()
                
        setupScrollView()
        
        setUpPromotionImageView()
        setUpPromotionHeadLbl()
        setUpPromotionSubHeadLbl()
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
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpPromotionLbl(){
        headerView.addSubview(promotionLbl)
        NSLayoutConstraint.activate([
            promotionLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            promotionLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
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
    
    private func setUpPromotionImageView(){
        scrollContainer.addSubview(promotionImageView)
        NSLayoutConstraint.activate([
            promotionImageView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 24),
            promotionImageView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            promotionImageView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            promotionImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setUpPromotionHeadLbl(){
        scrollContainer.addSubview(promotionHeadLbl)
        NSLayoutConstraint.activate([
            promotionHeadLbl.topAnchor.constraint(equalTo: promotionImageView.bottomAnchor, constant: 24),
            promotionHeadLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            promotionHeadLbl.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
        ])
    }

    
    private func setUpPromotionSubHeadLbl(){
        scrollContainer.addSubview(promotionSubHeadLbl)
        NSLayoutConstraint.activate([
            promotionSubHeadLbl.topAnchor.constraint(equalTo: promotionHeadLbl.bottomAnchor, constant: 16),
            promotionSubHeadLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            promotionSubHeadLbl.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            promotionSubHeadLbl.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0)
        ])
    }
}
