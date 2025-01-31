//
//  SignUpViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 27/01/2025.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var isPasswordVisible = false
    
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
    
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let welcomeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "Create account and choose favorite menu"
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
            string: "Enter your email",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()
    
    
    let emaillbl: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
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

    let newPasslbl: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let newPasslblTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.layer.cornerRadius = 8
        textField.font = UIFont.appFont(.RobotoMedium, size: 16)
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appColor(.lightGrey)

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.lightGray
            ]
        )

        return textField
    }()

    private let passPreviewBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = UIColor.appColor(.grey)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func previewButtonPressed(_ sender: UIButton) {
        isPasswordVisible.toggle()

        newPasslblTextField.isSecureTextEntry = !isPasswordVisible
        let buttonImage = isPasswordVisible ? "eye" : "eye.slash.fill"
        passPreviewBtn.setImage(UIImage(systemName: buttonImage), for: .normal)
    }
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let passRecommendationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let minimumCharacterImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "crossIcon")
        return imageView
    }()
    
    let minimumCharacterlbl: UILabel = {
        let label = UILabel()
        label.text = "Minimum 8 characters"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let atleastNumImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "checkIcon")
        return imageView
    }()
    
    let atleastNumlbl: UILabel = {
        let label = UILabel()
        label.text = "Atleast 1 number (1-9)"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let lowerCaseImg: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "checkIcon")
        return imageView
    }()
    
    let lowerCaseLbl: UILabel = {
        let label = UILabel()
        label.text = "Atleast lowercase or uppercase letters"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let labelButtonStack: UIStackView = {
        let label = UILabel()
        label.text = "Have an account?"
        label.font = UIFont.appFont(.RobotoMedium, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let policyHead: UILabel = {
        let label = UILabel()
        label.text = "By clicking Register, you agree to our"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let policySubHead: UILabel = {
        let label = UILabel()
        label.text = "Terms, Data Policy."
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.purple)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passPreviewBtn.addTarget(self, action: #selector(previewButtonPressed(_:)), for: .touchUpInside)

        view.backgroundColor = .white
        setUp()
    }
    
    private func setUp() {
        setupScrollView()
        setUpBackArrow()
        
        setUpSignUpView()
        
        setUpWelcomeLbl()
        setUpSubHead()
        
        setUpNameLbl()
        setUpNameTxtField()
        
        setUpEmaillbl()
        setUpEmailTextField()
        
        setUpNewPasslbl()
        setUPNewPasslblTextField()
        setUpNewPassPreview()
        
        setUpPassRecommendationView()
        setUpMinimumCharacterImg()
        setUpMinimumCharacterlbl()
        setUpAtleastNumImg()
        setUpAtleastNumLbl()
        setUpLowerCaseImg()
        setUpLowerCaseLbl()
        
        setUpRegisterButton()
        
        setUpLabelButtonStack()
        
        setUpPolicyHead()
        setUpPolicySubHead()
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
            scrollContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    
    private func setUpBackArrow(){
        scrollContainer.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: scrollContainer.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setUpSignUpView(){
        scrollContainer.addSubview(signUpView)
        NSLayoutConstraint.activate([
            signUpView.leadingAnchor.constraint(equalTo: scrollContainer.leadingAnchor, constant: 24),
            signUpView.trailingAnchor.constraint(equalTo: scrollContainer.trailingAnchor, constant: -24),
          //  signUpView.centerXAnchor.constraint(equalTo: scrollContainer.centerXAnchor),
            signUpView.centerYAnchor.constraint(equalTo: scrollContainer.centerYAnchor),
            signUpView.bottomAnchor.constraint(equalTo: scrollContainer.bottomAnchor,constant: -56)
            
        ])
    }
    
    
    private func setUpWelcomeLbl(){
        signUpView.addSubview(welcomeLbl)
        NSLayoutConstraint.activate([
            welcomeLbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            welcomeLbl.topAnchor.constraint(equalTo: signUpView.topAnchor, constant: 0)
        ])
    }
    
    private func setUpSubHead(){
        signUpView.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            subHead.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 8)
        ])
    }
    
    
    
    
    private func setUpNameLbl(){
        signUpView.addSubview(namelbl)
        NSLayoutConstraint.activate([
            namelbl.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 24),
            namelbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0)
            
        ])
    }
    
    private func setUpNameTxtField(){
        signUpView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: namelbl.bottomAnchor, constant: 6),
            nameTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            nameTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: 0),
            nameTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    
    private func setUpEmaillbl(){
        signUpView.addSubview(emaillbl)
        NSLayoutConstraint.activate([
            emaillbl.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emaillbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0)
            
        ])
    }
    
    private func setUpEmailTextField(){
        signUpView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emaillbl.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: 0),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpNewPasslbl(){
        signUpView.addSubview(newPasslbl)
        NSLayoutConstraint.activate([
            newPasslbl.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            newPasslbl.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0)
            
        ])
    }
    
    private func setUPNewPasslblTextField(){
        signUpView.addSubview(newPasslblTextField)
        NSLayoutConstraint.activate([
            newPasslblTextField.topAnchor.constraint(equalTo: newPasslbl.bottomAnchor, constant: 6),
            newPasslblTextField.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            newPasslblTextField.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: 0),
            newPasslblTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpNewPassPreview(){
        signUpView.addSubview(passPreviewBtn)
        NSLayoutConstraint.activate([
            passPreviewBtn.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: -40),
            passPreviewBtn.centerYAnchor.constraint(equalTo: newPasslblTextField.centerYAnchor),
            passPreviewBtn.widthAnchor.constraint(equalToConstant: 24),
            passPreviewBtn.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setUpPassRecommendationView(){
        signUpView.addSubview(passRecommendationView)
        NSLayoutConstraint.activate([
            passRecommendationView.topAnchor.constraint(equalTo: newPasslblTextField.bottomAnchor, constant: 16),
            passRecommendationView.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            passRecommendationView.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: 0),
            passRecommendationView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    private func setUpMinimumCharacterImg(){
        passRecommendationView.addSubview(minimumCharacterImg)
        NSLayoutConstraint.activate([
            minimumCharacterImg.topAnchor.constraint(equalTo: passRecommendationView.topAnchor, constant: 0),
            minimumCharacterImg.leadingAnchor.constraint(equalTo: passRecommendationView.leadingAnchor, constant: 0),
            minimumCharacterImg.widthAnchor.constraint(equalToConstant: 16),
            minimumCharacterImg.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func setUpMinimumCharacterlbl(){
        passRecommendationView.addSubview(minimumCharacterlbl)
        NSLayoutConstraint.activate([
            minimumCharacterlbl.leadingAnchor.constraint(equalTo: minimumCharacterImg.trailingAnchor, constant: 12),
            minimumCharacterlbl.centerYAnchor.constraint(equalTo: minimumCharacterImg.centerYAnchor)
        ])
    }
    
    private func setUpAtleastNumImg(){
        passRecommendationView.addSubview(atleastNumImg)
        NSLayoutConstraint.activate([
            atleastNumImg.topAnchor.constraint(equalTo: minimumCharacterImg.bottomAnchor, constant: 14),
            atleastNumImg.leadingAnchor.constraint(equalTo: passRecommendationView.leadingAnchor, constant: 0),
            atleastNumImg.widthAnchor.constraint(equalToConstant: 16),
            atleastNumImg.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func setUpAtleastNumLbl(){
        passRecommendationView.addSubview(atleastNumlbl)
        NSLayoutConstraint.activate([
            atleastNumlbl.leadingAnchor.constraint(equalTo: atleastNumImg.trailingAnchor, constant: 12),
            atleastNumlbl.centerYAnchor.constraint(equalTo: atleastNumImg.centerYAnchor)
        ])
    }
    
    
    private func setUpLowerCaseImg(){
        passRecommendationView.addSubview(lowerCaseImg)
        NSLayoutConstraint.activate([
            lowerCaseImg.topAnchor.constraint(equalTo: atleastNumImg.bottomAnchor, constant: 14),
            lowerCaseImg.leadingAnchor.constraint(equalTo: passRecommendationView.leadingAnchor, constant: 0),
            lowerCaseImg.widthAnchor.constraint(equalToConstant: 16),
            lowerCaseImg.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    private func setUpLowerCaseLbl(){
        passRecommendationView.addSubview(lowerCaseLbl)
        NSLayoutConstraint.activate([
            lowerCaseLbl.leadingAnchor.constraint(equalTo: lowerCaseImg.trailingAnchor, constant: 12),
            lowerCaseLbl.centerYAnchor.constraint(equalTo: lowerCaseImg.centerYAnchor)
        ])
    }
    
    
    private func setUpRegisterButton(){
        signUpView.addSubview(registerButton)
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passRecommendationView.bottomAnchor, constant: 24),
            registerButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor, constant: 0),
            registerButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor, constant: 0),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    

    private func setUpLabelButtonStack(){
        signUpView.addSubview(labelButtonStack)
        NSLayoutConstraint.activate([
            labelButtonStack.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 24),
            labelButtonStack.heightAnchor.constraint(equalToConstant: 20),
            labelButtonStack.centerXAnchor.constraint(equalTo: registerButton.centerXAnchor)
        ])
    }
    
    
    private func setUpPolicyHead(){
        signUpView.addSubview(policyHead)
        NSLayoutConstraint.activate([
            policyHead.topAnchor.constraint(equalTo: labelButtonStack.bottomAnchor, constant: 46),
            policyHead.centerXAnchor.constraint(equalTo: labelButtonStack.centerXAnchor),
            
        ])
    }
    
    private func setUpPolicySubHead(){
        signUpView.addSubview(policySubHead)
        NSLayoutConstraint.activate([
            policySubHead.centerXAnchor.constraint(equalTo: policyHead.centerXAnchor),
            policySubHead.topAnchor.constraint(equalTo: policyHead.bottomAnchor, constant: 0),
            policySubHead.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor, constant: 0)
        ])
    }
}


