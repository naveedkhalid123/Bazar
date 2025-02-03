//
//  SearchBarViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    
    private let searchLbl: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   

    private let searchBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let SearchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "greySearch")
        return imageView
    }()

    private let SearchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        
        textField.backgroundColor = UIColor.appColor(.lightGrey)
        
        textField.textColor = UIColor.appColor(.grey)
        textField.font = UIFont.appFont(.robotoRegular, size: 16)
        textField.textAlignment = .left
        textField.clearButtonMode = .whileEditing
    
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()

    
    var searchArr = ["The Good Sister","Carries Fisher"]
    
    private let searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25) 
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
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        setUp()
    }
    
    private func setUp(){
        
        setUpHeaderView()
        
        setUpSearchBarView()
        
        setUpFavouritesTableView()
    }
    
    private func setUpHeaderView() {
        view.addSubview(headerView)
        headerView.addSubview(backButton)
        headerView.addSubview(searchLbl)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            searchLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            searchLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpSearchBarView(){
        
        view.addSubview(searchBarView)
        searchBarView.addSubview(SearchImageView)
        searchBarView.addSubview(SearchTextField)
        
        
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchBarView.heightAnchor.constraint(equalToConstant: 48),
            
            SearchImageView.leadingAnchor.constraint(equalTo: searchBarView.leadingAnchor, constant: 16),
            SearchImageView.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor),
            SearchImageView.widthAnchor.constraint(equalToConstant: 24),
            SearchImageView.heightAnchor.constraint(equalToConstant: 24),
            
            SearchTextField.leadingAnchor.constraint(equalTo: SearchImageView.trailingAnchor, constant: 12),
            SearchTextField.trailingAnchor.constraint(equalTo: searchBarView.trailingAnchor, constant: -16),
            SearchTextField.centerYAnchor.constraint(equalTo: SearchImageView.centerYAnchor),
            SearchTextField.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
  
    private func setUpFavouritesTableView(){
        view.addSubview(searchTableView)
        NSLayoutConstraint.activate([
            searchTableView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor, constant: 16),
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            searchTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArr.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.searchLabel.text = searchArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
