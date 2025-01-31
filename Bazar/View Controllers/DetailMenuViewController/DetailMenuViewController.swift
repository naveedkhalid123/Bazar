//
//  DetailMenuViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 29/01/2025.
//

import UIKit

class DetailMenuViewController: UIViewController {
    
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
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineView")
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detailMenu")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let booksLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Kite Runner"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Love-Fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let bookVendorView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bookVendor")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private let bookDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gunty was born and raised in South Bend, Indiana. She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University."
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        return label
    }()
    
    
    private let reviewsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Reviews"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func setStarRating(_ rating: Double) {
        starStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let filledStarImage = UIImage(named: "fillStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for i in 1...5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = i <= Int(rating) ? filledStarImage : emptyStarImage
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 24),
                imageView.heightAnchor.constraint(equalToConstant: 24)
            ])
            starStackView.addArrangedSubview(imageView)
        }

        ratingLabel.text = String(format: "(%.1f)", rating)
        ratingLabel.font = .appFont(.robotoRegular, size: 16)
        ratingLabel.textColor = .appColor(.black)
        ratingLabel.textAlignment = .center
        
        starStackView.addArrangedSubview(ratingLabel)
    }

    
    private let productCountView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lessButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Less")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productCountLbl: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.appFont(.RobotoMedium, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Add")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productPriceLbl: UILabel = {
        let label = UILabel()
        label.text = "$39.99"
        label.font = UIFont.appFont(.RobotoMedium, size: 16)
        label.textColor = UIColor.appColor(.purple)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let continueShoppingBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Continue shopping", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .appFont(.openSansBold, size: 16)
        button.backgroundColor = .appColor(.purple)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let viewCartBtn: UIButton = {
        let button = UIButton()
        button.setTitle("View Cart", for: .normal)
        button.setTitleColor(.appColor(.purple), for: .normal)
        button.titleLabel?.font = .appFont(.openSansBold, size: 16)
        button.backgroundColor = .appColor(.lightGrey)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp() {
        setupScrollView()
        setUpLineView()
        setUpMenuImageView()
        
        setUpBooksLbl()
        setUpHeartButton()
        setUpBookVendorView()
        setUpBookDesc()
        
        setUpReviewsLbl()
        
        setUpStarStack()
        
        setUpProductCountView()
        setUpLessButton()
        setUpAddButton()
        setUpProductCountLbl()
        
        setUpProductPriceLbl()
        
        setUpContinueShoppingBtn()
        setUpViewCartBtn()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
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
    
    private func setUpLineView() {
        scrollContainer.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    private func setUpMenuImageView() {
        scrollContainer.addSubview(menuImageView)
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 19),
            menuImageView.centerXAnchor.constraint(equalTo: lineView.centerXAnchor),
            menuImageView.heightAnchor.constraint(equalToConstant: 313),
            menuImageView.widthAnchor.constraint(equalToConstant: 237)
        ])
    }
    
    private func setUpBooksLbl(){
        scrollContainer.addSubview(booksLbl)
        NSLayoutConstraint.activate([
            booksLbl.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 16),
            booksLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpHeartButton(){
        scrollContainer.addSubview(heartButton)
        NSLayoutConstraint.activate([
            heartButton.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            heartButton.centerYAnchor.constraint(equalTo: booksLbl.centerYAnchor)
        ])
    }
    
    private func setUpBookVendorView(){
        scrollContainer.addSubview(bookVendorView)
        NSLayoutConstraint.activate([
            bookVendorView.topAnchor.constraint(equalTo: booksLbl.bottomAnchor, constant: 12),
            bookVendorView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            bookVendorView.widthAnchor.constraint(equalToConstant: 80),
            bookVendorView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    private func setUpBookDesc(){
        scrollContainer.addSubview(bookDesc)
        NSLayoutConstraint.activate([
            bookDesc.topAnchor.constraint(equalTo: bookVendorView.bottomAnchor, constant: 12),
            bookDesc.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            bookDesc.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
           
        ])
    }
    
    private func setUpReviewsLbl(){
        scrollContainer.addSubview(reviewsLbl)
        NSLayoutConstraint.activate([
            reviewsLbl.topAnchor.constraint(equalTo: bookDesc.bottomAnchor, constant: 24),
            reviewsLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpStarStack() {
        scrollContainer.addSubview(starStackView)
        NSLayoutConstraint.activate([
            starStackView.topAnchor.constraint(equalTo: reviewsLbl.bottomAnchor, constant: 8),
            starStackView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            starStackView.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        setStarRating(4.0)
    }
    
    private func setUpProductCountView(){
        scrollContainer.addSubview(productCountView)
        NSLayoutConstraint.activate([
            productCountView.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 24),
            productCountView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            productCountView.widthAnchor.constraint(equalToConstant: 106),
            productCountView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpLessButton(){
        productCountView.addSubview(lessButton)
        NSLayoutConstraint.activate([
            lessButton.leadingAnchor.constraint(equalTo: productCountView.leadingAnchor, constant: 8),
            lessButton.centerYAnchor.constraint(equalTo: productCountView.centerYAnchor)
        ])
    }
    
    private func setUpAddButton(){
        productCountView.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: productCountView.trailingAnchor, constant: -8),
            addButton.centerYAnchor.constraint(equalTo: productCountView.centerYAnchor)
        ])
    }
    
    private func setUpProductCountLbl(){
        productCountView.addSubview(productCountLbl)
        NSLayoutConstraint.activate([
            productCountLbl.centerXAnchor.constraint(equalTo: productCountView.centerXAnchor),
            productCountLbl.centerYAnchor.constraint(equalTo: productCountView.centerYAnchor),
        ])
    }
    
    private func setUpProductPriceLbl(){
        scrollContainer.addSubview(productPriceLbl)
        NSLayoutConstraint.activate([
            productPriceLbl.leadingAnchor.constraint(equalTo: productCountView.trailingAnchor, constant: 16),
            productPriceLbl.centerYAnchor.constraint(equalTo: productCountView.centerYAnchor)
        ])
    }
    
    private func setUpContinueShoppingBtn(){
        scrollContainer.addSubview(continueShoppingBtn)
        NSLayoutConstraint.activate([
            continueShoppingBtn.topAnchor.constraint(equalTo: productCountView.bottomAnchor, constant: 10),
            continueShoppingBtn.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            continueShoppingBtn.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: -24),
            continueShoppingBtn.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    private func setUpViewCartBtn(){
        scrollContainer.addSubview(viewCartBtn)
        NSLayoutConstraint.activate([
            viewCartBtn.leadingAnchor.constraint(equalTo: continueShoppingBtn.trailingAnchor, constant: 12),
            viewCartBtn.centerYAnchor.constraint(equalTo: continueShoppingBtn.centerYAnchor),
            viewCartBtn.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            viewCartBtn.widthAnchor.constraint(equalToConstant: 115),
            viewCartBtn.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    
    
    
}
