//
//  YourFavouriteViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 30/01/2025.
//

import UIKit

class YourFavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
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
    
    
    private let favouritetLbl: UILabel = {
        let label = UILabel()
        label.text = "Your Favourite"
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
    
    var favouritesArr = [["img":"fvt1","desc":"In in amet ultrices sit.","price":"$19.99"],["img":"fvt2","desc":"Bibendum facilisis.","price":"$27.12"],["img":"fvt3","desc":"Nulla et diam cras.","price":"$13.52"],["img":"fvt4","desc":"Risus malesuada in.","price":"$19.99"],]
    
    private let favouritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouritesTableViewCell.self, forCellReuseIdentifier: "FavouritesTableViewCell")
        tableView.separatorStyle = .singleLine
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
        
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        
        setUp()
    }
    
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpFavouritetLbl()
        
        setupScrollView()
        setUpFavouritesTableView()
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
    
    private func setUpFavouritetLbl(){
        headerView.addSubview(favouritetLbl)
        NSLayoutConstraint.activate([
            favouritetLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            favouritetLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
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

    
    private func setUpFavouritesTableView(){
        scrollContainer.addSubview(favouritesTableView)
        NSLayoutConstraint.activate([
            favouritesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            favouritesTableView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            favouritesTableView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            favouritesTableView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            favouritesTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesArr.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
        cell.favouriteImageView.image = UIImage(named: favouritesArr[indexPath.row]["img"] ?? "")
        cell.fvtDes.text = favouritesArr[indexPath.row]["desc"]
        cell.priceLbl.text = favouritesArr[indexPath.row]["price"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }

    
}

