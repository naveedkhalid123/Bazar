//
//  AddressViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 31/01/2025.
//

import UIKit
import GoogleMaps

class AddressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {
   
    
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
        label.text = "Location"
        label.font = UIFont.appFont(.openSansBold, size: 20)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mapView: GMSMapView = {
        let view = GMSMapView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationManager = CLLocationManager()
    
    private let addressView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3 
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 6
        
        return view
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineView")
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let GPSButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "GPS-Fill"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let streatAddressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let streatLocationBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "streatLocation"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addressLbl: UILabel = {
        let label = UILabel()
        label.text = "Utama Street No.20"
        label.font = UIFont.appFont(.RobotoBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressDes: UILabel = {
        let label = UILabel()
        label.text = "State Street No.15, New York 10001, United States"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let seperateLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineView")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let saveAddressLbl: UILabel = {
        let label = UILabel()
        label.text = "Save Address As"
        label.font = UIFont.appFont(.openSansBold, size: 16)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var addressArr = ["Home","Offices"]
    
    private lazy var saveAddressCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SaveAddressCollectionViewCell.self, forCellWithReuseIdentifier: "SaveAddressCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
        
      //  GPSButton.addTarget(self, action: #selector(GPSBtnPressed), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        confirmationButton.addTarget(self, action: #selector(confirmBtnPressed), for: .touchUpInside)
        
        setUp()
    }
    
    private func setUp(){
        setUpHeaderView()
        setUpbackButton()
        setUpLocationLbl()
        
        setUpMapView()
        
        setUpAddressView()
        setUpLineView()
        setUpGPSButton()
        
        setUpStreatAddressView()
        setUpStreatLocationBtn()
        setUpAddressLbl()
        setUpAddressDes()
        
        setUpSeperateLineView()
        
        setUpSaveAddressLbl()
        
        setUpSaveAddressCollectionView()
        
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
            backButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setUpLocationLbl(){
        headerView.addSubview(locationLbl)
        NSLayoutConstraint.activate([
            locationLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            locationLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }
    
    private func setUpMapView(){
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mapView.heightAnchor.constraint(equalToConstant: 223)
        ])
    }

    private func setUpAddressView(){
        view.addSubview(addressView)
        NSLayoutConstraint.activate([
            addressView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 16),
            addressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            addressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            addressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    private func setUpLineView(){
        addressView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 16),
            lineView.centerXAnchor.constraint(equalTo: addressView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    private func setUpGPSButton(){
        addressView.addSubview(GPSButton)
        NSLayoutConstraint.activate([
            GPSButton.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -24),
            GPSButton.topAnchor.constraint(equalTo: addressView.topAnchor, constant: 37)
        ])
    }
    
    private func setUpStreatAddressView(){
        addressView.addSubview(streatAddressView)
        NSLayoutConstraint.activate([
            streatAddressView.topAnchor.constraint(equalTo: GPSButton.bottomAnchor, constant: 24),
            streatAddressView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 24),
            streatAddressView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -24),
            streatAddressView.heightAnchor.constraint(equalToConstant: 68)
        ])
    }
    
    private func setUpStreatLocationBtn(){
        streatAddressView.addSubview(streatLocationBtn)
        NSLayoutConstraint.activate([
            streatLocationBtn.topAnchor.constraint(equalTo: streatAddressView.topAnchor, constant: 0),
            streatLocationBtn.leadingAnchor.constraint(equalTo: streatAddressView.leadingAnchor, constant: 0),
            streatLocationBtn.widthAnchor.constraint(equalToConstant: 48),
            streatLocationBtn.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setUpAddressLbl(){
        streatAddressView.addSubview(addressLbl)
        NSLayoutConstraint.activate([
            addressLbl.topAnchor.constraint(equalTo: streatAddressView.topAnchor, constant: 0),
            addressLbl.leadingAnchor.constraint(equalTo: streatLocationBtn.trailingAnchor, constant: 16)
        ])
    }
    
    private func setUpAddressDes(){
        streatAddressView.addSubview(addressDes)
        NSLayoutConstraint.activate([
            addressDes.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 4),
            addressDes.leadingAnchor.constraint(equalTo: streatLocationBtn.trailingAnchor, constant: 16),
            addressDes.trailingAnchor.constraint(equalTo: streatAddressView.trailingAnchor, constant: 0),
            addressDes.bottomAnchor.constraint(equalTo: streatAddressView.bottomAnchor, constant: 0)
        ])
    }
    
    
    private func setUpSeperateLineView(){
        addressView.addSubview(seperateLineView)
        NSLayoutConstraint.activate([
            seperateLineView.topAnchor.constraint(equalTo: streatAddressView.bottomAnchor, constant: 24),
            seperateLineView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 24),
            seperateLineView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -24),
            seperateLineView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
    private func setUpSaveAddressLbl(){
        addressView.addSubview(saveAddressLbl)
        NSLayoutConstraint.activate([
            saveAddressLbl.topAnchor.constraint(equalTo: seperateLineView.bottomAnchor, constant: 16),
            saveAddressLbl.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpSaveAddressCollectionView(){
        addressView.addSubview(saveAddressCollectionView)
        NSLayoutConstraint.activate([
            saveAddressCollectionView.topAnchor.constraint(equalTo: saveAddressLbl.bottomAnchor, constant: 16),
            saveAddressCollectionView.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 24),
            saveAddressCollectionView.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -24),
            saveAddressCollectionView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    
    private func setUpConfirmationButton(){
        addressView.addSubview(confirmationButton)
        NSLayoutConstraint.activate([
            confirmationButton.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 24),
            confirmationButton.trailingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: -24),
            confirmationButton.bottomAnchor.constraint(equalTo: addressView.bottomAnchor, constant: -52),
            confirmationButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addressArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaveAddressCollectionViewCell", for: indexPath) as! SaveAddressCollectionViewCell
        cell.buttonLabel.text = addressArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5, height: 32)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

    guard status == .authorizedWhenInUse else {

    return

    }

    // 4

    locationManager.startUpdatingLocation()

    //5

    mapView.isMyLocationEnabled = true

    mapView.settings.myLocationButton = true

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    guard let location = locations.first else {

    return

    }

    mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

    }
    
    
    @objc func backBtnPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmBtnPressed(){
        let gpsVC  = SetLocationViewController()
        navigationController?.pushViewController(gpsVC, animated: true)
    }
}
