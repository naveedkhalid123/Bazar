//
//  CategoryController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class CategoryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "seachIcon"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let categoryLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category"
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
    
    // MARK: Top Categories Lbl Collection View
    
    var categoriesLblArr = ["All","Novels","Self Love","Science","Romantic","Poems","Books","Poems",]
    
    var selectedIndex = 0
    
    private lazy var categoriesLblCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(VendorsLblCollectionViewCell.self, forCellWithReuseIdentifier: "VendorsLblCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: Top Products Lbl Collection View

     var productsArr = [["img":"product1","label":"The Da vinci Code","price":"$14.99"],["img":"product2","label":"Carrie Fisher","price":"$20.99"],["img":"product3","label":"The Good Sister","price":"$14.99"],["img":"product4","label":"The Waiting","price":"$20.99"],["img":"product1","label":"The Da vinci Code","price":"$14.99"],["img":"product2","label":"Carrie Fisher","price":"$20.99"],["img":"product3","label":"The Good Sister","price":"$14.99"],["img":"product4","label":"The Waiting","price":"$20.99"]]
     
     private lazy var productsCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 11
         layout.minimumInteritemSpacing = 11

         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.backgroundColor = .clear
         collectionView.isScrollEnabled = false
         collectionView.showsVerticalScrollIndicator = false
         collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: "ProductsCollectionViewCell")
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         return collectionView
     }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationButton.addTarget(self, action: #selector(notifyBtnPressed), for: .touchUpInside)
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpSearchButton()
        setUpCategoryLbl()
        setUpNotificationButton()
        
        setupScrollView()
        
        setUpCategoriesLblCollectionView()
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
    
    private func setUpSearchButton(){
        headerView.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            searchButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    private func setUpCategoryLbl(){
        headerView.addSubview(categoryLbl)
        NSLayoutConstraint.activate([
            categoryLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            categoryLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpNotificationButton(){
        headerView.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            notificationButton.centerYAnchor.constraint(equalTo: categoryLbl.centerYAnchor)
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
    
    
    private func setUpCategoriesLblCollectionView(){
        scrollContainer.addSubview(categoriesLblCollectionView)
        NSLayoutConstraint.activate([
            categoriesLblCollectionView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 16),
            categoriesLblCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            categoriesLblCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            categoriesLblCollectionView.heightAnchor.constraint(equalToConstant: 28),
           // categoriesLblCollectionView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0)
        ])
    }
    
    
    private func setUpProductsCollectionView(){
        scrollContainer.addSubview(productsCollectionView)
        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: categoriesLblCollectionView.bottomAnchor, constant: 38),
            productsCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            productsCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            productsCollectionView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            productsCollectionView.heightAnchor.constraint(equalToConstant: 700)
        ])
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesLblCollectionView {
            return categoriesLblArr.count
        } else {
            return productsArr.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesLblCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorsLblCollectionViewCell", for: indexPath) as? VendorsLblCollectionViewCell else {
                return UICollectionViewCell()
            }
            let isSelected = indexPath.row == selectedIndex
            cell.configure(with: categoriesLblArr[indexPath.row], isSelected: isSelected)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            cell.imageView.image = UIImage(named: productsArr[indexPath.row]["img"] ?? "")
            cell.imageHeadLbl.text = productsArr[indexPath.row]["label"]
            cell.priceLbl.text = productsArr[indexPath.row]["price"]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == productsCollectionView {
            let detailMenuVC = DetailMenuViewController()
            self.navigationController?.pushViewController(detailMenuVC, animated: true)
        }
        
        selectedIndex = indexPath.row
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesLblCollectionView {
            return CGSize(width: collectionView.frame.width / 5, height: 28)
        }
        else{
            let padding: CGFloat = 11
            let width = (collectionView.frame.width - padding * 3) / 2
            return CGSize(width: width, height: 216)
        }
    }
    
    @objc func notifyBtnPressed(){
        let notifyVC = NotificationViewController()
        notifyVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(notifyVC, animated: true)
    }
    
}
