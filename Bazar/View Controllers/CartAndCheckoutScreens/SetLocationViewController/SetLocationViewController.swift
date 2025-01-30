//
//  SetLocationViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 29/01/2025.
//

import UIKit

class SetLocationViewController: UIViewController {
    
    
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
    
    
    private let locationLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        return label
    }()
    
    private let GPSButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "GPS-Fill"), for: .normal)
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
    
    
    let phonelbl: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your phone"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your email",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    
    let namelbl: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter your name",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    
    let governoratelbl: UILabel = {
        let label = UILabel()
        label.text = "Governorate"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let governorateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Governorate"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string:  "Enter Governorate",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    
    let citylbl: UILabel = {
        let label = UILabel()
        label.text = "City"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter city"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter city",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    
    let blockLbl: UILabel = {
        let label = UILabel()
        label.text = "Block"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let blockTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter block"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter block",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    
    let streatLbl: UILabel = {
        let label = UILabel()
        label.text = "Street name /number"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let streatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Street name /number"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter Street name /number",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    let buildingLLbl: UILabel = {
        let label = UILabel()
        label.text = "Building name/number"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let builidingTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Building name/number"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Building name/number",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    
    let floorLbl: UILabel = {
        let label = UILabel()
        label.text = "Floor (option)"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let floorTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Floor (option)"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Floor (option)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    
    
    let flatLbl: UILabel = {
        let label = UILabel()
        label.text = "Flat (option)"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let flatTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Flat (option)"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Flat (option)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    let avenueLbl: UILabel = {
        let label = UILabel()
        label.text = "Avenue (option)"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avenueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Avenue (option)"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Avenue (option)",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    
    private let confirmationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Confirmation", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpLocationLbl()
        setUpGPSButton()
        
        setupScrollView()
        
        setUpPhoneLbl()
        setUpPhoneTxtField()
        
        setUpNamelbl()
        setUpNameTextField()
        
        setUpGovernoratelbl()
        setUpGovernorateTextField()
        
        setUpCitylbl()
        setUpCityTextField()
        
        setUpBlockLbl()
        setUpBlockTextField()
        
        setUpStreatLbl()
        setUpStreatTextField()
        
        setUpBuildingLLbl()
        setUpBuilidingTextField()
        
        setUpFloorLbl()
        setUpFloorTextField()
        
        setUpFlatLbl()
        setUpFlatTextField()
        
        setUpAvenueLbl()
        setUpAvenueTextField()
        
        setUpConfirmationButton()
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
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    private func setUpLocationLbl(){
        headerView.addSubview(locationLbl)
        NSLayoutConstraint.activate([
            locationLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            locationLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpGPSButton(){
        headerView.addSubview(GPSButton)
        NSLayoutConstraint.activate([
            GPSButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -24),
            GPSButton.centerYAnchor.constraint(equalTo: locationLbl.centerYAnchor)
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

    
    private func setUpPhoneLbl(){
        scrollContainer.addSubview(phonelbl)
        NSLayoutConstraint.activate([
            phonelbl.topAnchor.constraint(equalTo: scrollContainer.topAnchor, constant: 16),
            phonelbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpPhoneTxtField(){
        scrollContainer.addSubview(phoneTextField)
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: phonelbl.bottomAnchor, constant: 6),
            phoneTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            phoneTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
          //  phoneTextField.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            phoneTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpNamelbl(){
        scrollContainer.addSubview(namelbl)
        NSLayoutConstraint.activate([
            namelbl.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 16),
            namelbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpNameTextField(){
        scrollContainer.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: namelbl.bottomAnchor, constant: 6),
            nameTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpGovernoratelbl(){
        scrollContainer.addSubview(governoratelbl)
        NSLayoutConstraint.activate([
            governoratelbl.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            governoratelbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpGovernorateTextField(){
        scrollContainer.addSubview(governorateTextField)
        NSLayoutConstraint.activate([
            governorateTextField.topAnchor.constraint(equalTo: governoratelbl.bottomAnchor, constant: 6),
            governorateTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            governorateTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            governorateTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpCitylbl(){
        scrollContainer.addSubview(citylbl)
        NSLayoutConstraint.activate([
            citylbl.topAnchor.constraint(equalTo: governorateTextField.bottomAnchor, constant: 16),
            citylbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpCityTextField(){
        scrollContainer.addSubview(cityTextField)
        NSLayoutConstraint.activate([
            cityTextField.topAnchor.constraint(equalTo: citylbl.bottomAnchor, constant: 6),
            cityTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            cityTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            cityTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpBlockLbl(){
        scrollContainer.addSubview(blockLbl)
        NSLayoutConstraint.activate([
            blockLbl.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 16),
            blockLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpBlockTextField(){
        scrollContainer.addSubview(blockTextField)
        NSLayoutConstraint.activate([
            blockTextField.topAnchor.constraint(equalTo: blockLbl.bottomAnchor, constant: 6),
            blockTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            blockTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            blockTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpStreatLbl(){
        scrollContainer.addSubview(streatLbl)
        NSLayoutConstraint.activate([
            streatLbl.topAnchor.constraint(equalTo: blockTextField.bottomAnchor, constant: 16),
            streatLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpStreatTextField(){
        scrollContainer.addSubview(streatTextField)
        NSLayoutConstraint.activate([
            streatTextField.topAnchor.constraint(equalTo: streatLbl.bottomAnchor, constant: 6),
            streatTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            streatTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            streatTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    private func setUpBuildingLLbl(){
        scrollContainer.addSubview(buildingLLbl)
        NSLayoutConstraint.activate([
            buildingLLbl.topAnchor.constraint(equalTo: streatTextField.bottomAnchor, constant: 16),
            buildingLLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpBuilidingTextField(){
        scrollContainer.addSubview(builidingTextField)
        NSLayoutConstraint.activate([
            builidingTextField.topAnchor.constraint(equalTo: buildingLLbl.bottomAnchor, constant: 6),
            builidingTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            builidingTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            builidingTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpFloorLbl(){
        scrollContainer.addSubview(floorLbl)
        NSLayoutConstraint.activate([
            floorLbl.topAnchor.constraint(equalTo: builidingTextField.bottomAnchor, constant: 16),
            floorLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpFloorTextField(){
        scrollContainer.addSubview(floorTextField)
        NSLayoutConstraint.activate([
            floorTextField.topAnchor.constraint(equalTo: floorLbl.bottomAnchor, constant: 6),
            floorTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            floorTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            floorTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpFlatLbl(){
        scrollContainer.addSubview(flatLbl)
        NSLayoutConstraint.activate([
            flatLbl.topAnchor.constraint(equalTo: floorTextField.bottomAnchor, constant: 16),
            flatLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpFlatTextField(){
        scrollContainer.addSubview(flatTextField)
        NSLayoutConstraint.activate([
            flatTextField.topAnchor.constraint(equalTo: flatLbl.bottomAnchor, constant: 6),
            flatTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            flatTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            flatTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpAvenueLbl(){
        scrollContainer.addSubview(avenueLbl)
        NSLayoutConstraint.activate([
            avenueLbl.topAnchor.constraint(equalTo: flatTextField.bottomAnchor, constant: 16),
            avenueLbl.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpAvenueTextField(){
        scrollContainer.addSubview(avenueTextField)
        NSLayoutConstraint.activate([
            avenueTextField.topAnchor.constraint(equalTo: avenueLbl.bottomAnchor, constant: 6),
            avenueTextField.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            avenueTextField.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            avenueTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    
    private func setUpConfirmationButton(){
        scrollContainer.addSubview(confirmationButton)
        NSLayoutConstraint.activate([
           confirmationButton.topAnchor.constraint(equalTo: avenueTextField.bottomAnchor, constant: 26),
            confirmationButton.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            confirmationButton.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            confirmationButton.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: -20),
            confirmationButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    
}
