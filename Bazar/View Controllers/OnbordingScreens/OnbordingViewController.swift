//
//  ViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 22/01/2025.
//

import UIKit

class OnbordingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var currentOnboardingPage = 0

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

    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 14)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        return button
    }()
    
    
    // MARK: Onboarding Collection View
    
    var onBoardingImagesArr = [["img":"bording1","head":"Now reading books will be easier", "subHead":" Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."],["img":"bording2","head":"Your Bookish Soulmate Awaits", "subHead":" Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience."],["img":"bording3","head":"Start Your Adventure", "subHead":" Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!"]]
    
    private lazy var onBoardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(OnbordingColelctionViewCell.self, forCellWithReuseIdentifier: "OnbordingColelctionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = onBoardingImagesArr.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.appColor(.purple)
        pageControl.pageIndicatorTintColor = UIColor.appColor(.grey)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
    
    
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appColor(.purple)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.backgroundColor = UIColor.appColor(.lightGrey)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        skipButton.addTarget(self, action: #selector(skipBtnPressed), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        setUp()
        pageControl.numberOfPages = onBoardingImagesArr.count
    }
    
    

    private func setUp() {
        setupScrollView()
        setUpSkipButton()
        setUpOnBoardingCollectionView()
        
        
        // automatically adjust the constraints according to the different mobile screens
        
        print("UIDevice.current",UIDevice.current.screenHeight)
        print("UIDevice.screenType",UIDevice.current.screenType)
      
        
        switch UIDevice.current.screenType {
        case .iphone_8:
            print("iphone 8")
            setUpPageiPhone8Control()
            setUpContinueiPhone8Button()
        case .iphone_8Plus:
            print("iphone 8 plus")
            setUpPageiPhone8Control()
            setUpContinueiPhone8Button()

        case .iphone_SE3:
            print("iphone se 3")
            setUpPageiPhone8Control()
            setUpContinueiPhone8Button()
            
        default:
            setUpPageControl()
            setUpStackButtons()
        }
        
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(scrollContainer)
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setUpSkipButton(){
        scrollContainer.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            skipButton.topAnchor.constraint(equalTo: scrollContainer.safeAreaLayoutGuide.topAnchor, constant: 0),
            skipButton.widthAnchor.constraint(equalToConstant: 60),
            skipButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
   
    private func setUpOnBoardingCollectionView(){
        scrollContainer.addSubview(onBoardingCollectionView)
        onBoardingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onBoardingCollectionView.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 13),
            onBoardingCollectionView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 0),
            onBoardingCollectionView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: 0),
            onBoardingCollectionView.heightAnchor.constraint(equalToConstant: 482)
        ])
    }
    
    
    private func setUpPageControl(){
        scrollContainer.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo:onBoardingCollectionView.bottomAnchor, constant: 28),
            pageControl.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: 0),
            pageControl.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    private func setUpStackButtons() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(continueButton)
        buttonStackView.addArrangedSubview(signInButton)

        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 56),
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
    
    
    private func setUpPageiPhone8Control(){
        scrollContainer.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo:onBoardingCollectionView.bottomAnchor, constant: 28),
            pageControl.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 8)
        ])
    }
    
    private func setUpContinueiPhone8Button() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(continueButton)
        buttonStackView.addArrangedSubview(signInButton)

        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 56),
            signInButton.heightAnchor.constraint(equalToConstant: 56),
            
            buttonStackView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
            
            buttonStackView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor, constant: -20)
        ])
    }


      
       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           let currentPage = Int(scrollView.contentOffset.x / onBoardingCollectionView.bounds.width)
           pageControl.currentPage = currentPage
           currentOnboardingPage = currentPage
        
           self.buttonTitleChange(currentPage)
           print(currentPage)

       }
    
    private func buttonTitleChange(_ currentPage: Int) {
        if currentPage == 2 {
            continueButton.setTitle("Get Started", for: .normal)
        }else {
            continueButton.setTitle("Continue", for: .normal)
        }
    }

    
    
    // MARK: Onboarding Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardingImagesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnbordingColelctionViewCell", for: indexPath) as! OnbordingColelctionViewCell
        cell.imageView.image = UIImage(named: onBoardingImagesArr[indexPath.row]["img"] ?? "")
        cell.headLbl.text = onBoardingImagesArr[indexPath.row]["head"]
        cell.subHead.text = onBoardingImagesArr[indexPath.row]["subHead"]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 482)
    }

    
    
    @objc private func skipBtnPressed() {
        navigateToSignIn()
    }
    
    
    @objc private func continueButtonTapped() {
        if currentOnboardingPage == 2 {
            navigateToSignIn()
        }else {
            currentOnboardingPage += 1
            pageControl.currentPage = currentOnboardingPage
            self.buttonTitleChange(currentOnboardingPage)
            onBoardingCollectionView.isPagingEnabled = false
            onBoardingCollectionView.scrollToItem(at: IndexPath(item: currentOnboardingPage, section: 0), at: .centeredHorizontally, animated: true)
            onBoardingCollectionView.isPagingEnabled = true
        }
    }

    @objc private func signInButtonTapped() {
        navigateToSignIn()
    }
    
    
    func navigateToSignIn(){
        let signInVC = SignInViewController()
//        let  nav = UINavigationController(rootViewController: signInVC)
//        nav.isNavigationBarHidden = true
        navigationController?.pushViewController(signInVC, animated: true)
    }
}

