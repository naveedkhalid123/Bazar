////
////  VendorViewController.swift
////  Bazar
////
////  Created by Naveed Khalid on 28/01/2025.
////
//
//import UIKit
//
//class VendorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    
//    private let headerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "backArrow"), for: .normal)
//        button.clipsToBounds = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    
//    private let vendorsLbl: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Vendords"
//        label.font = UIFont.appFont(.openSansBold, size: 20)
//        label.textColor = UIColor.appColor(.black)
//        return label
//    }()
//    
//    private let searchButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "seachIcon"), for: .normal)
//        button.clipsToBounds = true
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    let ourVendorsLbl: UILabel = {
//        let label = UILabel()
//        label.text = "Our Vendors"
//        label.font = .appFont(.robotoRegular, size: 16)
//        label.textColor = .appColor(.grey)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let vendorsHeadLbl: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Vendords"
//        label.font = UIFont.appFont(.openSansBold, size: 20)
//        label.textColor = UIColor.appColor(.purple)
//        return label
//    }()
//    
//    
//    // MARK: Top Vendors Lbl Collection View
//    
//    var vendorsLblArr = ["All","Books","Poems","Special for you","Books","Poems","Books","Poems",]
//    
//    var selectedIndex = 0
//    
//    private lazy var vendorsLblCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .clear
//        collectionView.isPagingEnabled = true
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.register(VendorsLblCollectionViewCell.self, forCellWithReuseIdentifier: "VendorsLblCollectionViewCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//    
//    
//    // MARK: Top Vendors Collection View
//    
//    var vendorsArr = [["img":"vendor5","lbl":"Wattpad"],["img":"vendor6","lbl":"Kuromi"],["img":"vendor7","lbl":"Crane & Co"],["img":"vendor8","lbl":"GooDay"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor8","lbl":"GooDay"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],]
//    
//    private lazy var vendorsCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .clear
//        collectionView.isPagingEnabled = true
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.register(AllVendorsCollectionViewCell.self, forCellWithReuseIdentifier: "AllVendorsCollectionViewCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setUp()
//    }
//    
//    private func setUp(){
//        setUpHeaderView()
//        setUpbackButton()
//        setUpvendorsLbl()
//        setUpsearchButton()
//        
//        setUpOurVendorsLbl()
//        setUpVendorsHeadLbl()
//        
//        setUpVendorsLblCollectionView()
//        setUpVendorsCollectionView()
//    }
//    private func setUpHeaderView() {
//        view.addSubview(headerView)
//        NSLayoutConstraint.activate([
//            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            headerView.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//    
//    private func setUpbackButton(){
//        headerView.addSubview(backButton)
//        NSLayoutConstraint.activate([
//            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
//            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
//        ])
//    }
//    
//    private func setUpvendorsLbl(){
//        headerView.addSubview(vendorsLbl)
//        NSLayoutConstraint.activate([
//            vendorsLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
//            vendorsLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
//        ])
//    }
//    
//    private func setUpsearchButton(){
//        headerView.addSubview(searchButton)
//        NSLayoutConstraint.activate([
//            searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
//            searchButton.centerYAnchor.constraint(equalTo: vendorsLbl.centerYAnchor)
//        ])
//    }
//    
//    private func setUpOurVendorsLbl(){
//        view.addSubview(ourVendorsLbl)
//        NSLayoutConstraint.activate([
//            ourVendorsLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
//            ourVendorsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
//        ])
//    }
//    
//    
//    private func setUpVendorsHeadLbl(){
//        view.addSubview(vendorsHeadLbl)
//        NSLayoutConstraint.activate([
//            vendorsHeadLbl.topAnchor.constraint(equalTo: ourVendorsLbl.bottomAnchor, constant: 0),
//            vendorsHeadLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
//        ])
//    }
//    
//    private func setUpVendorsLblCollectionView(){
//        view.addSubview(vendorsLblCollectionView)
//        NSLayoutConstraint.activate([
//            vendorsLblCollectionView.topAnchor.constraint(equalTo: vendorsHeadLbl.bottomAnchor, constant: 34),
//            vendorsLblCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            vendorsLblCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            vendorsLblCollectionView.heightAnchor.constraint(equalToConstant: 56)
//        ])
//    }
//    
//    
//    private func setUpVendorsCollectionView(){
//        view.addSubview(vendorsCollectionView)
//        NSLayoutConstraint.activate([
//            vendorsCollectionView.topAnchor.constraint(equalTo: vendorsLblCollectionView.bottomAnchor, constant: 12),
//            vendorsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            vendorsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            vendorsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//            
//        ])
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == vendorsLblCollectionView {
//            return vendorsLblArr.count
//        } else {
//            return vendorsArr.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == vendorsLblCollectionView {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorsLblCollectionViewCell", for: indexPath) as? VendorsLblCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            let isSelected = indexPath.row == selectedIndex
//            cell.configure(with: vendorsLblArr[indexPath.row], isSelected: isSelected)
//            return cell
//        } else {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllVendorsCollectionViewCell", for: indexPath) as? AllVendorsCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            if let imageName = vendorsArr[indexPath.row]["img"],
//               let labelName = vendorsArr[indexPath.row]["lbl"] {
//                cell.configure(image: UIImage(named: imageName), vendorName: labelName)
//            }
//            return cell
//        }
//    }
//
//        
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            
//            selectedIndex = indexPath.row
//            collectionView.reloadData()
//        }
//
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == vendorsLblCollectionView {
//            let width = floor(collectionView.frame.width / 6)
//            let height: CGFloat = 40
//            return CGSize(width: width, height: height)
//        } else {
//            let width = floor(collectionView.frame.width / 3 - 16)
//            let height: CGFloat = 180 
//            return CGSize(width: width, height: height)
//        }
//    }
//
//
//    
//}
//
//



//
//  VendorViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//

import UIKit

class VendorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
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
    
    
    private let vendorsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vendords"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "seachIcon"), for: .normal)
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let ourVendorsLbl: UILabel = {
        let label = UILabel()
        label.text = "Our Vendors"
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vendorsHeadLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vendords"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.purple)
        return label
    }()
    
    
    // MARK: Top Vendors Lbl Collection View
    
    var vendorsLblArr = ["All","Books","Poems","Special for you","Books","Poems","Books","Poems",]
    
    var selectedIndex = 0
    
    private lazy var vendorsLblCollectionView: UICollectionView = {
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
    
    
    // MARK: Top Vendors Collection View
    
    var vendorsArr = [["img":"vendor5","lbl":"Wattpad"],["img":"vendor6","lbl":"Kuromi"],["img":"vendor7","lbl":"Crane & Co"],["img":"vendor8","lbl":"GooDay"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor8","lbl":"GooDay"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],["img":"vendor9","lbl":"Warehouse"],["img":"vendor10","lbl":"Peppa Pig"],["img":"vendor11","lbl":"Jstor"],["img":"vendor12","lbl":"Peloton"],["img":"vendor13","lbl":"Haymarket"],]
    
    private lazy var vendorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AllVendorsCollectionViewCell.self, forCellWithReuseIdentifier: "AllVendorsCollectionViewCell")
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
        setUpvendorsLbl()
        setUpsearchButton()
        
        setupScrollView()
        
        setUpOurVendorsLbl()
        setUpVendorsHeadLbl()
        
        setUpVendorsLblCollectionView()
        setUpVendorsCollectionView()
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

    private func setUpbackButton() {
        headerView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }

    private func setUpvendorsLbl() {
        headerView.addSubview(vendorsLbl)
        NSLayoutConstraint.activate([
            vendorsLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            vendorsLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }

    private func setUpsearchButton() {
        headerView.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            searchButton.centerYAnchor.constraint(equalTo: vendorsLbl.centerYAnchor)
        ])
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
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

    private func setUpOurVendorsLbl() {
        scrollContainer.addSubview(ourVendorsLbl)
        NSLayoutConstraint.activate([
            ourVendorsLbl.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 16),
            ourVendorsLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }

    private func setUpVendorsHeadLbl() {
        scrollContainer.addSubview(vendorsHeadLbl)
        NSLayoutConstraint.activate([
            vendorsHeadLbl.topAnchor.constraint(equalTo: ourVendorsLbl.bottomAnchor, constant: 0),
            vendorsHeadLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }

    private func setUpVendorsLblCollectionView() {
        scrollContainer.addSubview(vendorsLblCollectionView)
        NSLayoutConstraint.activate([
            vendorsLblCollectionView.topAnchor.constraint(equalTo: vendorsHeadLbl.bottomAnchor, constant: 34),
            vendorsLblCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 16),
            vendorsLblCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            vendorsLblCollectionView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setUpVendorsCollectionView() {
        scrollContainer.addSubview(vendorsCollectionView)
        NSLayoutConstraint.activate([
            vendorsCollectionView.topAnchor.constraint(equalTo: vendorsLblCollectionView.bottomAnchor, constant: 12),
            vendorsCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            vendorsCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            vendorsCollectionView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            vendorsCollectionView.heightAnchor.constraint(equalToConstant: 900)

        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == vendorsLblCollectionView {
            return vendorsLblArr.count
        } else {
            return vendorsArr.count
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == vendorsLblCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorsLblCollectionViewCell", for: indexPath) as? VendorsLblCollectionViewCell else {
                return UICollectionViewCell()
            }
            let isSelected = indexPath.row == selectedIndex
            cell.configure(with: vendorsLblArr[indexPath.row], isSelected: isSelected)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllVendorsCollectionViewCell", for: indexPath) as? AllVendorsCollectionViewCell else {
                return UICollectionViewCell()
            }
            if let imageName = vendorsArr[indexPath.row]["img"],
               let labelName = vendorsArr[indexPath.row]["lbl"] {
                cell.configure(image: UIImage(named: imageName), vendorName: labelName)
            }
            return cell
        }
    }

        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            selectedIndex = indexPath.row
            collectionView.reloadData()
        }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == vendorsLblCollectionView {
            let width = floor(collectionView.frame.width / 6)
            let height: CGFloat = 40
            return CGSize(width: width, height: height)
        } else {
            let width = floor(collectionView.frame.width / 3 - 16)
            let height: CGFloat = 180
            return CGSize(width: width, height: height)
        }
    }


    
}





