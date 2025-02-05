//
//  ProfileController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAdaptivePresentationControllerDelegate {

    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
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
    
    private let upperLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 28
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    private let userNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "John Doe"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let userContact: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(+1) 234 567 890"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        return label
    }()
    
    private  let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(UIColor(named: "red"), for: .normal)
        button.titleLabel?.font = .appFont(.openSansBold, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let lowerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lightGrey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var profileArr = [["img":"account","lbl":"My Account"],["img":"address","lbl":"Address"],["img":"offers","lbl":"Offers & Promos"],["img":"favourites","lbl":"Your Favorites"],["img":"history","lbl":"Order History"],["img":"help","lbl":"Help Center"],]
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        logoutButton.addTarget(self, action: #selector(logoutBtnPressed), for: .touchUpInside)

        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpHomeLbl()

        setupScrollView()
        
        setUpUpperLineView()
        
        setUpProfileHeaderView()
        setUpProfileImageView()
        setUpUserNameLbl()
        setUpUserContact()
        setUpLogoutButton()
        
        setUplowerLineView()
        setUpProfileTableView()
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
    
    private func setUpHomeLbl(){
        headerView.addSubview(profileLbl)
        NSLayoutConstraint.activate([
            profileLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
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
    
    private func setUpUpperLineView(){
        scrollContainer.addSubview(upperLineView)
        NSLayoutConstraint.activate([
            upperLineView.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 24),
            upperLineView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            upperLineView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            upperLineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setUpProfileHeaderView(){
        scrollContainer.addSubview(profileHeaderView)
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: upperLineView.bottomAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    private func setUpProfileImageView(){
        profileHeaderView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 24),
            profileImageView.centerYAnchor.constraint(equalTo: profileHeaderView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 56),
            profileImageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setUpUserNameLbl() {
        profileHeaderView.addSubview(userNameLbl)
        NSLayoutConstraint.activate([
            userNameLbl.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            userNameLbl.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5)
        ])
    }

    private func setUpUserContact(){
        profileHeaderView.addSubview(userContact)
        NSLayoutConstraint.activate([
            userContact.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            userContact.topAnchor.constraint(equalTo: userNameLbl.bottomAnchor, constant: 2)
        ])
    }
    
    private func setUpLogoutButton(){
        profileHeaderView.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -24),
            logoutButton.centerYAnchor.constraint(equalTo: profileHeaderView.centerYAnchor)
        ])
    }
    
    private func setUplowerLineView(){
        scrollContainer.addSubview(lowerLineView)
        NSLayoutConstraint.activate([
            lowerLineView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 0),
            lowerLineView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            lowerLineView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            lowerLineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setUpProfileTableView(){
        scrollContainer.addSubview(profileTableView)
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: lowerLineView.bottomAnchor, constant: 16),
            profileTableView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            profileTableView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            profileTableView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            profileTableView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none 
        cell.profileImageView.image = UIImage(named: profileArr[indexPath.row]["img"] ?? "")
        cell.profileLabel.text = profileArr[indexPath.row]["lbl"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Blur Effect
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.tag = 10
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.3
        self.view.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        if let blurEffectView = self.view.viewWithTag(10) {
            blurEffectView.removeFromSuperview()
        }
    }

    
    // MARK: - Table View Did Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = AccountViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = AddressViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = OrderOffersViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = YourFavouriteViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = OrderHistoryViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = HelpCenterViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }

    
    @objc func logoutBtnPressed() {


        self.addBlurEffect()
        let vc = LogoutViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
    }
    
}
