//
//  OrderOffersViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 29/01/2025.
//

import UIKit

class OrderOffersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
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
    
    private let orderHistoryLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Order History"
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
    
    private let coupansHeadLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You Have 5 Copons to use"
        label.font = UIFont.appFont(.openSansBold, size: 18)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    
    // MARK: Top Coupans Lbl Collection View

     var coupansArr = ["offer1","offer2","offer3","offer4","offer5","offer6","offer2","offer3","offer4","offer5",]
     
     private lazy var coupansCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical


         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.backgroundColor = .clear
         collectionView.isPagingEnabled = true
         collectionView.showsVerticalScrollIndicator = false
         collectionView.isScrollEnabled = false
         collectionView.register(CoupansCollectionViewCell.self, forCellWithReuseIdentifier: "CoupansCollectionViewCell")
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         return collectionView
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpOrdersHistoryLbl()
        
        setupScrollView()
        
        setUpCoupansHeadLbl()
        setUpCoupansCollectionView()
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
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    private func setUpOrdersHistoryLbl(){
        headerView.addSubview(orderHistoryLbl)
        NSLayoutConstraint.activate([
            orderHistoryLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            orderHistoryLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
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
    
    private func setUpCoupansHeadLbl(){
        scrollContainer.addSubview(coupansHeadLbl)
        NSLayoutConstraint.activate([
            coupansHeadLbl.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 24),
            coupansHeadLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
        ])
    }
    
    private func setUpCoupansCollectionView(){
        scrollContainer.addSubview(coupansCollectionView)
        NSLayoutConstraint.activate([
            coupansCollectionView.topAnchor.constraint(equalTo: coupansHeadLbl.bottomAnchor, constant: 34),
            coupansCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            coupansCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            coupansCollectionView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            coupansCollectionView.heightAnchor.constraint(equalToConstant: 900)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coupansArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoupansCollectionViewCell", for: indexPath) as! CoupansCollectionViewCell
        cell.imageView.image = UIImage(named: coupansArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 16
        let totalSpacing = spacing * 1
        let width = (collectionView.frame.width - totalSpacing) / 2
        return CGSize(width: width, height: 161)
    }

}
