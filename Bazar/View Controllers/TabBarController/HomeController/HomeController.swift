//
//  HomeController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
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
    
    
    private let homeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home"
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
    
    
    // MARK: Onboarding Collection View
    
    var bannerImagesArr = ["banner","banner","banner",]
    
    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BannerImgCollectionViewCell.self, forCellWithReuseIdentifier: "BannerImgCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = bannerImagesArr.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.appColor(.purple)
        pageControl.pageIndicatorTintColor = UIColor.appColor(.grey)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
    private let topOfWeekView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topOfWeekLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top of Week"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.appColor(.purple), for: .normal)
        button.titleLabel?.font = .appFont(.RobotoBold, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: Top of Week Collection View
    
    var topOfWeekArr = [["img":"topWeek1","label":"The Kite Runner","price":"$14.99"],["img":"topWeek2","label":"The Kite Runner","price":"$20.99"],["img":"topWeek1","label":"The Kite Runner","price":"$14.99"],["img":"topWeek2","label":"The Kite Runner","price":"$20.99"]]
    
    private lazy var topOfWeekCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TopOfWeekCollectionViewCell.self, forCellWithReuseIdentifier: "TopOfWeekCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: Vendor View
    
    private let bestVendorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bestVendorLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Best Vendors"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let vendorSeeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.appColor(.purple), for: .normal)
        button.titleLabel?.font = .appFont(.RobotoBold, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Top Vendor Collection View
    
    var topVendorArr = ["vendors1","vendors2","vendors3","vendors4","vendors2","vendors3"]
    
    private lazy var topVendorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TopVendorsCollectionViewCell.self, forCellWithReuseIdentifier: "TopVendorsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: Author View
    
    private let authorsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let authorsLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Authors"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let authorsSeeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.appColor(.purple), for: .normal)
        button.titleLabel?.font = .appFont(.RobotoBold, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: Top Authors Collection View
    
    var authorsArr = [["img":"author1","nameLbl":"John Freeman","category":"Writer"],["img":"author2","nameLbl":"Tess Gunty","category":"Novelist"],["img":"author1","nameLbl":"John Freeman","category":"Writer"],["img":"author2","nameLbl":"Tess Gunty","category":"Novelist"],]
    
    private lazy var topAuthorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AuthorsCollectionViewCell.self, forCellWithReuseIdentifier: "AuthorsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        searchButton.addTarget(self, action: #selector(searchBtnPressed), for: .touchUpInside)
        notificationButton.addTarget(self, action: #selector(notifyBtnPressed), for: .touchUpInside)
        
        setUp()
        
        pageControl.numberOfPages = bannerImagesArr.count
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpSearchButton()
        setUpHomeLbl()
        setUpNotificationButton()
        
        setupScrollView()
        
        setUpBannerCollectionView()
        setUpPageControl()
        
        setUpTopOfWeekView()
        setUpTopOfWeekLbl()
        setUpSeeAllButton()
        setUpTopOfWeekCollectionView()
        
        setUpBestVendorView()
        setUpTopVendorLbl()
        setUpVendorSeeAllButton()
        setUpTopVendorsCollectionView()
        
        setUpAuthorsView()
        setUpAuthorsLbl()
        setUpAuthorsSeeAllButton()
        setUpTopAuthorsCollectionView()
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
    
    private func setUpHomeLbl(){
        headerView.addSubview(homeLbl)
        NSLayoutConstraint.activate([
            homeLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            homeLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpNotificationButton(){
        headerView.addSubview(notificationButton)
        NSLayoutConstraint.activate([
            notificationButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            notificationButton.centerYAnchor.constraint(equalTo: homeLbl.centerYAnchor)
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
    
    
    private func setUpBannerCollectionView(){
        scrollContainer.addSubview(bannerCollectionView)
        NSLayoutConstraint.activate([
            bannerCollectionView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 16),
            bannerCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            bannerCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: 162)
        ])
    }
    
    
    private func setUpPageControl(){
        scrollContainer.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo:bannerCollectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    // MARK: Top of Week View
    
    private func setUpTopOfWeekView(){
        scrollContainer.addSubview(topOfWeekView)
        NSLayoutConstraint.activate([
            topOfWeekView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 27),
            topOfWeekView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            topOfWeekView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
        ])
    }
    
    private func setUpTopOfWeekLbl(){
        topOfWeekView.addSubview(topOfWeekLbl)
        NSLayoutConstraint.activate([
            topOfWeekLbl.topAnchor.constraint(equalTo: topOfWeekView.topAnchor, constant: 0),
            topOfWeekLbl.leadingAnchor.constraint(equalTo: topOfWeekView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpSeeAllButton(){
        topOfWeekView.addSubview(seeAllButton)
        NSLayoutConstraint.activate([
            seeAllButton.topAnchor.constraint(equalTo: topOfWeekView.topAnchor, constant: 2),
            seeAllButton.trailingAnchor.constraint(equalTo: topOfWeekView.trailingAnchor, constant: -22)
        ])
    }
    
    
    private func setUpTopOfWeekCollectionView(){
        topOfWeekView.addSubview(topOfWeekCollectionView)
        NSLayoutConstraint.activate([
            topOfWeekCollectionView.topAnchor.constraint(equalTo: topOfWeekLbl.bottomAnchor, constant: 16),
            topOfWeekCollectionView.leadingAnchor.constraint(equalTo: topOfWeekView.leadingAnchor, constant: 24),
            topOfWeekCollectionView.trailingAnchor.constraint(equalTo: topOfWeekView.trailingAnchor, constant: 0),
            topOfWeekCollectionView.bottomAnchor.constraint(equalTo: topOfWeekView.bottomAnchor, constant: 0),
            topOfWeekCollectionView.heightAnchor.constraint(equalToConstant: 198)
        ])
    }
    
    
    // MARK: Vendor View
    private func setUpBestVendorView(){
        scrollContainer.addSubview(bestVendorView)
        NSLayoutConstraint.activate([
            bestVendorView.topAnchor.constraint(equalTo: topOfWeekView.bottomAnchor, constant: 32),
            bestVendorView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            bestVendorView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
        ])
    }
    
    
    private func setUpTopVendorLbl(){
        bestVendorView.addSubview(bestVendorLbl)
        NSLayoutConstraint.activate([
            bestVendorLbl.topAnchor.constraint(equalTo: bestVendorView.topAnchor, constant: 0),
            bestVendorLbl.leadingAnchor.constraint(equalTo: bestVendorView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpVendorSeeAllButton(){
        bestVendorView.addSubview(vendorSeeAllButton)
        NSLayoutConstraint.activate([
            vendorSeeAllButton.topAnchor.constraint(equalTo: bestVendorView.topAnchor, constant: 2),
            vendorSeeAllButton.trailingAnchor.constraint(equalTo: bestVendorView.trailingAnchor, constant: -22)
        ])
    }
    
    
    private func setUpTopVendorsCollectionView(){
        bestVendorView.addSubview(topVendorCollectionView)
        NSLayoutConstraint.activate([
            topVendorCollectionView.topAnchor.constraint(equalTo: bestVendorLbl.bottomAnchor, constant: 16),
            topVendorCollectionView.leadingAnchor.constraint(equalTo: bestVendorView.leadingAnchor, constant: 20),
            topVendorCollectionView.trailingAnchor.constraint(equalTo: bestVendorView.trailingAnchor, constant: 0),
            topVendorCollectionView.bottomAnchor.constraint(equalTo: bestVendorView.bottomAnchor, constant: 0),
            topVendorCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    
    
    
    // MARK: Authors View
    
    private func setUpAuthorsView(){
        scrollContainer.addSubview(authorsView)
        NSLayoutConstraint.activate([
            authorsView.topAnchor.constraint(equalTo: bestVendorView.bottomAnchor, constant: 32),
            authorsView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            authorsView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            authorsView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            authorsView.heightAnchor.constraint(equalToConstant: 223)
        ])
    }
    
    
    private func setUpAuthorsLbl(){
        authorsView.addSubview(authorsLbl)
        NSLayoutConstraint.activate([
            authorsLbl.topAnchor.constraint(equalTo: authorsView.topAnchor, constant: 0),
            authorsLbl.leadingAnchor.constraint(equalTo: authorsView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpAuthorsSeeAllButton(){
        authorsView.addSubview(authorsSeeAllButton)
        NSLayoutConstraint.activate([
            authorsSeeAllButton.topAnchor.constraint(equalTo: authorsView.topAnchor, constant: 2),
            authorsSeeAllButton.trailingAnchor.constraint(equalTo: authorsView.trailingAnchor, constant: -22)
        ])
    }
    
    private func setUpTopAuthorsCollectionView(){
        authorsView.addSubview(topAuthorsCollectionView)
        NSLayoutConstraint.activate([
            topAuthorsCollectionView.topAnchor.constraint(equalTo: authorsLbl.bottomAnchor, constant: 16),
            topAuthorsCollectionView.leadingAnchor.constraint(equalTo: authorsView.leadingAnchor, constant: 24),
            topAuthorsCollectionView.trailingAnchor.constraint(equalTo: authorsView.trailingAnchor, constant: 0),
            topAuthorsCollectionView.bottomAnchor.constraint(equalTo: authorsView.bottomAnchor, constant: 0),
            topAuthorsCollectionView.heightAnchor.constraint(equalToConstant: 183)
        ])
    }
    
    // scrollView page controlling function
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / bannerCollectionView.bounds.width)
        pageControl.currentPage = currentPage

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return bannerImagesArr.count
        } else if collectionView == topOfWeekCollectionView {
            return topOfWeekArr.count
        } else if collectionView == topVendorCollectionView {
            return topVendorArr.count
        } else {
           return authorsArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerImgCollectionViewCell", for: indexPath) as! BannerImgCollectionViewCell
            cell.bannerImageView.image = UIImage(named: bannerImagesArr[indexPath.row])
            return cell
        } else if collectionView == topOfWeekCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopOfWeekCollectionViewCell", for: indexPath) as! TopOfWeekCollectionViewCell
            cell.imageView.image = UIImage(named: topOfWeekArr[indexPath.row]["img"] ?? "")
            cell.imageHeadLbl.text = topOfWeekArr[indexPath.row]["label"]
            cell.priceLbl.text = topOfWeekArr[indexPath.row]["price"]
            return cell
        } else  if collectionView == topVendorCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopVendorsCollectionViewCell", for: indexPath) as! TopVendorsCollectionViewCell
            cell.vendorsImageView.image = UIImage(named: topVendorArr[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorsCollectionViewCell", for: indexPath) as! AuthorsCollectionViewCell
            cell.imageView.image = UIImage(named: authorsArr[indexPath.row]["img"] ?? "")
            cell.authorNameLbl.text = authorsArr[indexPath.row]["nameLbl"]
            cell.authorCategoryLbl.text = authorsArr[indexPath.row]["category"]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == bannerCollectionView {
            return CGSize(width: collectionView.frame.width, height: 162)
        } else if collectionView == topOfWeekCollectionView {
            return CGSize(width: collectionView.frame.width / 2.5, height: 198)
        } else  if collectionView == topVendorCollectionView {
            return CGSize(width: collectionView.frame.width / 4, height: 80)
        } else {
            return CGSize(width: collectionView.frame.width / 2.5, height: 183)
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bannerCollectionView {
            // Handle bannerCollectionView selection here if needed
        } else if collectionView == topOfWeekCollectionView {
            let detailMenuVC = DetailMenuViewController()
            self.navigationController?.pushViewController(detailMenuVC, animated: true)
        } else if collectionView ==  topVendorCollectionView {
            let topVendorVC = VendorViewController()
            topVendorVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(topVendorVC, animated: true)
        } else {
            let topAuthorsVC = AuthorViewController()
            topAuthorsVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(topAuthorsVC, animated: true)
        }
    }

    
    @objc func searchBtnPressed(){
        let searchVC = SearchBarViewController()
        searchVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func notifyBtnPressed(){
        let notifyVC = NotificationViewController()
        notifyVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(notifyVC, animated: true)
    }
    
}




