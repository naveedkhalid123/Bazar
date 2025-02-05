//
//  DeliveryDateViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 01/02/2025.
//

import UIKit

class DeliveryDateViewController: UIViewController {
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
        
    var dismissHandler: (() -> Void)?
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           var touch: UITouch? = touches.first
           dismissHandler?()
           if touch?.view == self.view {
               self.dismiss(animated: true)
           }
           
       }
    
    private let deliveryDateView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.lineView)
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let deliveryLbl: UILabel = {
        let label = UILabel()
        label.text = "Delivery Date"
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let todayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today 12 Jan"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let todayViewBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(todayViewTapped), for: .touchUpInside)
        return button
    }()

    
    private let tomorrowView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tomorrowLabel: UILabel = {
        let label = UILabel()
        label.text = "Tomorrow 12 Jan"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tommorrowViewBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tommorrowViewTapped), for: .touchUpInside)
        return button
    }()

    
    private let pickaDateView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pickDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Pick a date"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pickDateViewBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pickDateViewTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [todayView, tomorrowView, pickaDateView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let timeLbl: UILabel = {
        let label = UILabel()
        label.text = "Delivery Time"
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeView1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel1: UILabel = {
        let label = UILabel()
        label.text = "Between 10PM : 11PM"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeView1Btn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(timeViewTapped), for: .touchUpInside)
        return button
    }()
    
    
    private let timeView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel2: UILabel = {
        let label = UILabel()
        label.text = "Between 10PM : 11PM"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        label.font = .appFont(.openSansBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let timeView2Btn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(timeView2Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeView1, timeView2])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let confirmationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appColor(.black)?.withAlphaComponent(0.3)
        
        setUp()
    }
    
    private func setUp() {
        setUpDeliveryDateView()
        setUpDateStackView()
        setUpTimeLbl()
        setUpConfirmationButton()
    }
    
    private func setUpDeliveryDateView() {
        view.addSubview(deliveryDateView)
        deliveryDateView.addSubview(lineView)
        deliveryDateView.addSubview(deliveryLbl)

        NSLayoutConstraint.activate([
            deliveryDateView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            deliveryDateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            deliveryDateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          
            lineView.topAnchor.constraint(equalTo: deliveryDateView.topAnchor, constant: 17),
            lineView.centerXAnchor.constraint(equalTo: deliveryDateView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 56),
            lineView.heightAnchor.constraint(equalToConstant: 5),

            deliveryLbl.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 16),
            deliveryLbl.leadingAnchor.constraint(equalTo: deliveryDateView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpDateStackView() {
        
        deliveryDateView.addSubview(dateStackView)
        
        todayView.addSubview(todayViewBtn)
        todayView.addSubview(todayLabel)
        
        tomorrowView.addSubview(tommorrowViewBtn)
        tomorrowView.addSubview(tomorrowLabel)
        
        pickaDateView.addSubview(pickDateViewBtn)
        pickaDateView.addSubview(pickDateLabel)

        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: deliveryLbl.bottomAnchor, constant: 16),
            dateStackView.leadingAnchor.constraint(equalTo: deliveryDateView.leadingAnchor, constant: 24),
            dateStackView.trailingAnchor.constraint(equalTo: deliveryDateView.trailingAnchor, constant: -24),
            dateStackView.heightAnchor.constraint(equalToConstant: 80),
            
            todayViewBtn.topAnchor.constraint(equalTo: todayView.topAnchor, constant: 0),
            todayViewBtn.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 0),
            todayViewBtn.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: 0),
            todayViewBtn.bottomAnchor.constraint(equalTo: todayView.bottomAnchor, constant: 0),
            
            todayLabel.centerXAnchor.constraint(equalTo: todayView.centerXAnchor),
            todayLabel.centerYAnchor.constraint(equalTo: todayView.centerYAnchor),
            todayLabel.leadingAnchor.constraint(equalTo: todayView.leadingAnchor, constant: 10),
            todayLabel.trailingAnchor.constraint(equalTo: todayView.trailingAnchor, constant: -10),

            
            tommorrowViewBtn.topAnchor.constraint(equalTo: tomorrowView.topAnchor, constant: 0),
            tommorrowViewBtn.leadingAnchor.constraint(equalTo: tomorrowView.leadingAnchor, constant: 0),
            tommorrowViewBtn.trailingAnchor.constraint(equalTo: tomorrowView.trailingAnchor, constant: 0),
            tommorrowViewBtn.bottomAnchor.constraint(equalTo: tomorrowView.bottomAnchor, constant: 0),
            
            tomorrowLabel.centerXAnchor.constraint(equalTo: tomorrowView.centerXAnchor),
            tomorrowLabel.centerYAnchor.constraint(equalTo: tomorrowView.centerYAnchor),
            tomorrowLabel.leadingAnchor.constraint(equalTo: tomorrowView.leadingAnchor, constant: 10),
            tomorrowLabel.trailingAnchor.constraint(equalTo: tomorrowView.trailingAnchor, constant: -10),
            
            pickDateViewBtn.topAnchor.constraint(equalTo: pickaDateView.topAnchor, constant: 0),
            pickDateViewBtn.leadingAnchor.constraint(equalTo: pickaDateView.leadingAnchor, constant: 0),
            pickDateViewBtn.trailingAnchor.constraint(equalTo: pickaDateView.trailingAnchor, constant: 0),
            pickDateViewBtn.bottomAnchor.constraint(equalTo: pickaDateView.bottomAnchor, constant: 0),
            
            pickDateLabel.centerXAnchor.constraint(equalTo: pickaDateView.centerXAnchor),
            pickDateLabel.centerYAnchor.constraint(equalTo: pickaDateView.centerYAnchor),
            pickDateLabel.leadingAnchor.constraint(equalTo: pickaDateView.leadingAnchor, constant: 10),
            pickDateLabel.trailingAnchor.constraint(equalTo: pickaDateView.trailingAnchor, constant: -10),
            
        ])
    }
    
    
    private func setUpTimeLbl(){
        
        deliveryDateView.addSubview(timeLbl)
        deliveryDateView.addSubview(timeStackView)
        
        deliveryDateView.addSubview(timeView1Btn)
        
        timeView1.addSubview(timeLabel1)
        timeView2.addSubview(timeLabel2)
        
        deliveryDateView.addSubview(timeView2Btn)
        
        NSLayoutConstraint.activate([
            timeLbl.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 25),
            timeLbl.leadingAnchor.constraint(equalTo: deliveryDateView.leadingAnchor, constant: 24),
            
            timeStackView.topAnchor.constraint(equalTo: timeLbl.bottomAnchor, constant: 16),
            timeStackView.leadingAnchor.constraint(equalTo: deliveryDateView.leadingAnchor, constant: 24),
            timeStackView.trailingAnchor.constraint(equalTo: deliveryDateView.trailingAnchor, constant: -24),
            timeStackView.heightAnchor.constraint(equalToConstant: 80),
            
            timeView1Btn.topAnchor.constraint(equalTo: timeView1.topAnchor, constant: 0),
            timeView1Btn.leadingAnchor.constraint(equalTo: timeView1.leadingAnchor, constant: 0),
            timeView1Btn.trailingAnchor.constraint(equalTo: timeView1.trailingAnchor, constant: 0),
            timeView1Btn.bottomAnchor.constraint(equalTo: timeView1.bottomAnchor, constant: 0),
            
            timeLabel1.centerXAnchor.constraint(equalTo: timeView1.centerXAnchor),
            timeLabel1.centerYAnchor.constraint(equalTo: timeView1.centerYAnchor),
            timeLabel1.leadingAnchor.constraint(equalTo: timeView1.leadingAnchor, constant: 10),
            timeLabel1.trailingAnchor.constraint(equalTo: timeView1.trailingAnchor, constant: -10),
            
            
            timeView2Btn.topAnchor.constraint(equalTo: timeView2.topAnchor, constant: 0),
            timeView2Btn.leadingAnchor.constraint(equalTo: timeView2.leadingAnchor, constant: 0),
            timeView2Btn.trailingAnchor.constraint(equalTo: timeView2.trailingAnchor, constant: 0),
            timeView2Btn.bottomAnchor.constraint(equalTo: timeView2.bottomAnchor, constant: 0),
            
            timeLabel2.centerXAnchor.constraint(equalTo: timeView2.centerXAnchor),
            timeLabel2.centerYAnchor.constraint(equalTo: timeView2.centerYAnchor),
            timeLabel2.leadingAnchor.constraint(equalTo: timeView2.leadingAnchor, constant: 10),
            timeLabel2.trailingAnchor.constraint(equalTo: timeView2.trailingAnchor, constant: -10),
            
            
        ])
    }
    
    
    private func setUpConfirmationButton(){
        deliveryDateView.addSubview(confirmationButton)
        NSLayoutConstraint.activate([
           confirmationButton.topAnchor.constraint(equalTo: timeStackView.bottomAnchor, constant: 50),
            confirmationButton.leadingAnchor.constraint(equalTo: deliveryDateView.leadingAnchor, constant: 24),
            confirmationButton.trailingAnchor.constraint(equalTo: deliveryDateView.trailingAnchor, constant: -24),
            confirmationButton.bottomAnchor.constraint(equalTo: deliveryDateView.bottomAnchor, constant: -30),
            confirmationButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    

    @objc private func todayViewTapped() {
        print("Today View Button Clicked!")
        updateSelection(selectedView: todayViewBtn, resetViews: [tommorrowViewBtn, pickDateViewBtn])
    }

    @objc private func tommorrowViewTapped() {
        print("Tomorrow View Button Clicked!")
        updateSelection(selectedView: tommorrowViewBtn, resetViews: [todayViewBtn, pickDateViewBtn])
    }

    @objc private func pickDateViewTapped() {
        print("Pick Date View Button Clicked!")
        updateSelection(selectedView: pickDateViewBtn, resetViews: [todayViewBtn, tommorrowViewBtn])
    }

    private func updateSelection(selectedView: UIButton, resetViews: [UIButton]) {
       
        for view in resetViews {
            view.layer.borderWidth = 0
        }

        selectedView.layer.borderColor = UIColor.appColor(.purple)?.cgColor
        selectedView.layer.borderWidth = 2
    }
    
    
    @objc private func timeViewTapped() {
        print("Today View Button Clicked!")
        updateTimeSelection(selectedView: timeView1Btn, resetViews: [timeView2Btn])
    }

    @objc private func timeView2Tapped() {
        print("Tomorrow View Button Clicked!")
        updateTimeSelection(selectedView: timeView2Btn, resetViews: [timeView1Btn])
    }

   

    private func updateTimeSelection(selectedView: UIButton, resetViews: [UIButton]) {
       
        for view in resetViews {
            view.layer.borderWidth = 0
        }

        selectedView.layer.borderColor = UIColor.appColor(.purple)?.cgColor
        selectedView.layer.borderWidth = 1
    }


}









