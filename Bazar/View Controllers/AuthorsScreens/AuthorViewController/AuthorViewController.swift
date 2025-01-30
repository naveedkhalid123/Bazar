////
////  AuthorViewController.swift
////  Bazar
////
////  Created by Naveed Khalid on 28/01/2025.
////
//
//
//import UIKit
//
//class AuthorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
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
//    private let authorsLbl: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Authors"
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
//    
//    let clickAuthorsLbl: UILabel = {
//        let label = UILabel()
//        label.text = "Check the authors"
//        label.font = .appFont(.robotoRegular, size: 16)
//        label.textColor = .appColor(.grey)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let authorsHeadLbl: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Authors"
//        label.font = UIFont.appFont(.openSansBold, size: 20)
//        label.textColor = UIColor.appColor(.purple)
//        return label
//    }()
//    
//    
//    // MARK: Top Vendors Lbl Collection View
//    
//    var authorsLblArr = ["All","Poets","Plays","Novelists","Journalist","Novelists","Books","Poems",]
//    
//    var selectedIndex = 0
//    
//    private lazy var authorsLblCollectionView: UICollectionView = {
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
//    // MARK: Top Authors Table View  View
//    
//    var authorsDetailsArr = [["img":"author3","name":"John Freeman","desc":"American writer he  was the editor of the"],["img":"author4","name":"Adam Dalva","desc":"He is the senior fiction editor of guernica ma"],["img":"author5","name":"Abraham verghese","desc":"He is the professor and Linda R . Meier and "],["img":"author6","name":"Tess Gunty","desc":"AGunty was born and raised in south bend,indiana"],["img":"author7","name":"Ann Napolitano","desc":"She is the author of the novels A Good Hard"],["img":"author3","name":"Hernan Diaz","desc":"American writer he  was the editor of the"],["img":"author4","name":"John Freeman","desc":"American writer he  was the editor of the"],]
//    
//    
//    
//    
//    private let authorsTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(AuthorDetailsTableViewCell.self, forCellReuseIdentifier: "AuthorDetailsTableViewCell")
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = .clear
//        tableView.allowsSelection = false
//        tableView.showsVerticalScrollIndicator = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setUp()
//        
//        authorsTableView.delegate = self
//        authorsTableView.dataSource = self
//    }
//    
//    private func setUp(){
//        setUpHeaderView()
//        setUpbackButton()
//        setUpAuthorsLbl()
//        setUpsearchButton()
//        
//        setUpClickAuthorsLbl()
//        setUpAuthorsHeadLbl()
//        
//        setUpAuthorsLblCollectionView()
//        setUpAuthorsTableView()
//        
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
//    private func setUpAuthorsLbl(){
//        headerView.addSubview(authorsLbl)
//        NSLayoutConstraint.activate([
//            authorsLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
//            authorsLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
//        ])
//    }
//    
//    private func setUpsearchButton(){
//        headerView.addSubview(searchButton)
//        NSLayoutConstraint.activate([
//            searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
//            searchButton.centerYAnchor.constraint(equalTo: authorsLbl.centerYAnchor)
//        ])
//    }
//    
//    private func setUpClickAuthorsLbl(){
//        view.addSubview(clickAuthorsLbl)
//        NSLayoutConstraint.activate([
//            clickAuthorsLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
//            clickAuthorsLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
//        ])
//    }
//    
//    
//    private func setUpAuthorsHeadLbl(){
//        view.addSubview(authorsHeadLbl)
//        NSLayoutConstraint.activate([
//            authorsHeadLbl.topAnchor.constraint(equalTo: clickAuthorsLbl.bottomAnchor, constant: 0),
//            authorsHeadLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
//        ])
//    }
//    
//    private func setUpAuthorsLblCollectionView(){
//        view.addSubview(authorsLblCollectionView)
//        NSLayoutConstraint.activate([
//            authorsLblCollectionView.topAnchor.constraint(equalTo: authorsHeadLbl.bottomAnchor, constant: 34),
//            authorsLblCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            authorsLblCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            authorsLblCollectionView.heightAnchor.constraint(equalToConstant: 56)
//        ])
//    }
//    
//    
//    private func setUpAuthorsTableView(){
//        view.addSubview(authorsTableView)
//        NSLayoutConstraint.activate([
//            authorsTableView.topAnchor.constraint(equalTo: authorsLblCollectionView.bottomAnchor, constant: 18),
//            authorsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            authorsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            authorsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//        ])
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return authorsLblArr.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorsLblCollectionViewCell", for: indexPath) as? VendorsLblCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        
//        let isSelected = indexPath.row == selectedIndex
//        cell.configure(with: authorsLblArr[indexPath.row], isSelected: isSelected)
//        return cell
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedIndex = indexPath.row
//        collectionView.reloadData()
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = floor(collectionView.frame.width / 6)
//        let height: CGFloat = 40
//        return CGSize(width: width, height: height)
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return authorsDetailsArr.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorDetailsTableViewCell", for: indexPath) as! AuthorDetailsTableViewCell
//        cell.authorImageView.image = UIImage(named: authorsDetailsArr[indexPath.row]["img"] ?? "")
//        cell.authorNameLabel.text = authorsDetailsArr[indexPath.row]["name"]
//        cell.authorDescriptionLabel.text = authorsDetailsArr[indexPath.row]["desc"]
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        if let cell = tableView.cellForRow(at: indexPath) {
//            cell.selectionStyle = .none
//        }
//        
//    }
//    
//}




//
//  AuthorViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//


import UIKit

class AuthorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    
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
        return view
    }()
    
    
    let clickAuthorsLbl: UILabel = {
        let label = UILabel()
        label.text = "Check the authors"
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorsHeadLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Authors"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.purple)
        return label
    }()
    
    
    // MARK: Top Vendors Lbl Collection View
    
    var authorsLblArr = ["All","Poets","Plays","Novelists","Journalist","Novelists","Books","Poems",]
    
    var selectedIndex = 0
    
    private lazy var authorsLblCollectionView: UICollectionView = {
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
    
    
    // MARK: Top Authors Table View  View
    
    var authorsDetailsArr = [["img":"author3","name":"John Freeman","desc":"American writer he  was the editor of the"],["img":"author4","name":"Adam Dalva","desc":"He is the senior fiction editor of guernica ma"],["img":"author5","name":"Abraham verghese","desc":"He is the professor and Linda R . Meier and "],["img":"author6","name":"Tess Gunty","desc":"AGunty was born and raised in south bend,indiana"],["img":"author7","name":"Ann Napolitano","desc":"She is the author of the novels A Good Hard"],["img":"author3","name":"Hernan Diaz","desc":"American writer he  was the editor of the"],["img":"author4","name":"John Freeman","desc":"American writer he  was the editor of the"],]
    
    
    
    
    private let authorsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AuthorDetailsTableViewCell.self, forCellReuseIdentifier: "AuthorDetailsTableViewCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        
        authorsTableView.delegate = self
        authorsTableView.dataSource = self
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpAuthorsLbl()
        setUpsearchButton()
        
        setupScrollView()
        
        setUpClickAuthorsLbl()
        setUpAuthorsHeadLbl()
        
        setUpAuthorsLblCollectionView()
        setUpAuthorsTableView()
        
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
    
    private func setUpAuthorsLbl(){
        headerView.addSubview(authorsLbl)
        NSLayoutConstraint.activate([
            authorsLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            authorsLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpsearchButton(){
        headerView.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            searchButton.centerYAnchor.constraint(equalTo: authorsLbl.centerYAnchor)
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
    
    private func setUpClickAuthorsLbl(){
        scrollContainer.addSubview(clickAuthorsLbl)
        NSLayoutConstraint.activate([
            clickAuthorsLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            clickAuthorsLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }
    
    
    private func setUpAuthorsHeadLbl(){
        scrollContainer.addSubview(authorsHeadLbl)
        NSLayoutConstraint.activate([
            authorsHeadLbl.topAnchor.constraint(equalTo: clickAuthorsLbl.bottomAnchor, constant: 0),
            authorsHeadLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpAuthorsLblCollectionView(){
        scrollContainer.addSubview(authorsLblCollectionView)
        NSLayoutConstraint.activate([
            authorsLblCollectionView.topAnchor.constraint(equalTo: authorsHeadLbl.bottomAnchor, constant: 34),
            authorsLblCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 16),
            authorsLblCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            authorsLblCollectionView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
    private func setUpAuthorsTableView(){
        scrollContainer.addSubview(authorsTableView)
        NSLayoutConstraint.activate([
            authorsTableView.topAnchor.constraint(equalTo: authorsLblCollectionView.bottomAnchor, constant: 18),
            authorsTableView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 20),
            authorsTableView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -20),
            authorsTableView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            authorsTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return authorsLblArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VendorsLblCollectionViewCell", for: indexPath) as? VendorsLblCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let isSelected = indexPath.row == selectedIndex
        cell.configure(with: authorsLblArr[indexPath.row], isSelected: isSelected)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(collectionView.frame.width / 6)
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorsDetailsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorDetailsTableViewCell", for: indexPath) as! AuthorDetailsTableViewCell
        cell.authorImageView.image = UIImage(named: authorsDetailsArr[indexPath.row]["img"] ?? "")
        cell.authorNameLabel.text = authorsDetailsArr[indexPath.row]["name"]
        cell.authorDescriptionLabel.text = authorsDetailsArr[indexPath.row]["desc"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.selectionStyle = .none
        }
        
    }
    
}
