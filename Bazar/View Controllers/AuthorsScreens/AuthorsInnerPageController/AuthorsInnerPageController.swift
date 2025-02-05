//
//  AuthorsInnerPageController.swift
//  Bazar
//
//  Created by Naveed Khalid on 29/01/2025.
//

import UIKit

class AuthorsInnerPageController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
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
    
    private let authorsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Authors"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
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

    private let authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "innerAuthor")
        imageView.layer.cornerRadius = 62
        return imageView
    }()
    
    let authorCategoryLbl: UILabel = {
        let label = UILabel()
        label.text = "Novelist"
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorNameLbl: UILabel = {
        let label = UILabel()
        label.text = "Tess Gunty"
        label.font = .appFont(.RobotoBold, size: 20)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
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

    
    private let aboutLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let aboutDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gunty was born and raised in South Bend, Indiana. She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University."
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        return label
    }()


    private let productLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    
    
   // MARK: Top Vendors Lbl Collection View

    var productsArr = [["img":"product1","label":"The Da vinci Code","price":"$14.99"],["img":"product2","label":"Carrie Fisher","price":"$20.99"],["img":"product3","label":"The Good Sister","price":"$14.99"],["img":"product4","label":"The Waiting","price":"$20.99"]]
    
    private lazy var productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 11
        layout.minimumInteritemSpacing = 11

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpAuthorsLbl()
        
        setupScrollView()
        
        setUpAuthorImageView()
        setUpauthorCategoryLbl()
        setUpauthorNameLbl()
        
        setUpStarStack()
        
        setUpAboutLbl()
        setUpAboutDesc()
        
        setUpproductLbl()
        setUpProductsCollectionView()
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
    private func setUpAuthorsLbl(){
        headerView.addSubview(authorsLbl)
        NSLayoutConstraint.activate([
            authorsLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            authorsLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
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

    private func setUpAuthorImageView(){
        scrollContainer.addSubview(authorImageView)
        NSLayoutConstraint.activate([
            authorImageView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 0),
            authorImageView.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            authorImageView.widthAnchor.constraint(equalToConstant: 124),
            authorImageView.heightAnchor.constraint(equalToConstant: 124),
        ])
    }

    private func setUpauthorCategoryLbl(){
        scrollContainer.addSubview(authorCategoryLbl)
        NSLayoutConstraint.activate([
            authorCategoryLbl.topAnchor.constraint(equalTo: authorImageView.bottomAnchor, constant: 8),
            authorCategoryLbl.centerXAnchor.constraint(equalTo: authorImageView.centerXAnchor)
        ])
    }
    
    private func setUpauthorNameLbl(){
        scrollContainer.addSubview(authorNameLbl)
        NSLayoutConstraint.activate([
            authorNameLbl.topAnchor.constraint(equalTo: authorCategoryLbl.bottomAnchor, constant: 10),
            authorNameLbl.centerXAnchor.constraint(equalTo: authorCategoryLbl.centerXAnchor)
        ])
    }
    
    private func setUpStarStack() {
        scrollContainer.addSubview(starStackView)
        NSLayoutConstraint.activate([
            starStackView.centerXAnchor.constraint(equalTo: authorNameLbl.centerXAnchor),
            starStackView.topAnchor.constraint(equalTo: authorNameLbl.bottomAnchor, constant: 25),
            starStackView.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        setStarRating(4.0)
    }
    
    
    private func setUpAboutLbl(){
        scrollContainer.addSubview(aboutLbl)
        NSLayoutConstraint.activate([
            aboutLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            aboutLbl.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 22)
        ])
    }
    
    private func setUpAboutDesc(){
        scrollContainer.addSubview(aboutDesc)
        NSLayoutConstraint.activate([
            aboutDesc.topAnchor.constraint(equalTo: aboutLbl.bottomAnchor, constant: 8),
            aboutDesc.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            aboutDesc.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
           
        ])
    }
    
    
    private func setUpproductLbl(){
        scrollContainer.addSubview(productLbl)
        NSLayoutConstraint.activate([
            productLbl.topAnchor.constraint(equalTo: aboutDesc.bottomAnchor, constant: 22),
            productLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
           
        ])
    }
    
    private func setUpProductsCollectionView(){
        scrollContainer.addSubview(productsCollectionView)
        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: productLbl.bottomAnchor, constant: 14),
            productsCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            productsCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            productsCollectionView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            productsCollectionView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.imageView.image = UIImage(named: productsArr[indexPath.row]["img"] ?? "")
        cell.imageHeadLbl.text = productsArr[indexPath.row]["label"]
        cell.priceLbl.text = productsArr[indexPath.row]["price"]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 11
        let width = (collectionView.frame.width - padding * 3) / 2
        return CGSize(width: width, height: 216)
    }
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
    
}
