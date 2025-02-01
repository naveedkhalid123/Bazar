//
//  SignInViewController.swift
//  Bazar
//
//  Created by Naveed Khalid on 24/01/2025.
//

import UIKit

class SignInViewController: UIViewController {
    

    var isPasswordVisible = false

    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let signInView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let welcomeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome Back 👋"
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        return label
    }()

    let subHead: UILabel = {
        let label = UILabel()
        label.text = "Sign to your account"
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let forgotPassBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.purple)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.appFont(.openSansBold, size: 16)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let labelButtonStack: UIStackView = {
        let label = UILabel()
        label.text = "Don’t have an account?"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.appColor(.purple), for: .normal)
        button.titleLabel?.font = UIFont.appFont(.RobotoMedium, size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    private let leftLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.appColor(.lineView)
        return view
    }()
    
    
    let orWithLbl: UILabel = {
        let label = UILabel()
        label.text = "Or With"
        label.font = UIFont.appFont(.robotoRegular, size: 14)
        label.textColor = UIColor.appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.appColor(.lineView)
        return view
    }()
    
    
    private let googleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let googleSubView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "google")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let signInWithGooglelbl: UILabel = {
        let label = UILabel()
        label.text = "Sign In With Google"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let appleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.appColor(.lineView)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let appleSubView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private let appleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let signInWithApplelbl: UILabel = {
        let label = UILabel()
        label.text = "Sign In With Apple"
        label.font = UIFont.appFont(.RobotoMedium, size: 14)
        label.textColor = UIColor.appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let googleViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)  // Add action
        return button
    }()

 
    let appleViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)  // Add action
        return button
    }()

  
    @objc func googleButtonTapped() {
        print("Google Button Tapped")
    }

 
    @objc func appleButtonTapped() {
        print("Apple Button Tapped")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        passPreviewBtn.addTarget(self, action: #selector(previewButtonPressed(_:)), for: .touchUpInside)
        setUp()

    }
    
    private func setUp(){
        setUpBackArrow()
        setUpSignInView()
        setUpWelcomeLbl()
        setUpSubHead()
        
        setUpEmaillbl()
        setUpEmailTextField()
        
        setUpNewPasslbl()
        setUPNewPasslblTextField()
        setUpNewPassPreview()
        
        setUpForgotPassBtn()
        
        setUpLoginButton()
        
        setUpLabelButtonStack()
        
        setUpOrWithLbl()
        
        setUpGoogleView()
        setUpGoogleSubView()
        
        setUpGoogleViewButton()
        
        setUpAppleView()
        setUpAppleSubView()
        setUPAppleViewButton()
    }
    
    private func setUpBackArrow(){
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
    private func setUpSignInView(){
        view.addSubview(signInView)
        NSLayoutConstraint.activate([
            signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setUpWelcomeLbl(){
        signInView.addSubview(welcomeLbl)
        NSLayoutConstraint.activate([
            welcomeLbl.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            welcomeLbl.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 0)
        ])
    }
    
    private func setUpSubHead(){
        signInView.addSubview(subHead)
        NSLayoutConstraint.activate([
            subHead.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            subHead.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 8)
        ])
    }
    
    private func setUpEmaillbl(){
        signInView.addSubview(emaillbl)
        NSLayoutConstraint.activate([
            emaillbl.topAnchor.constraint(equalTo: subHead.bottomAnchor, constant: 24),
            emaillbl.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUpEmailTextField(){
        signInView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emaillbl.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpNewPasslbl(){
        signInView.addSubview(newPasslbl)
        NSLayoutConstraint.activate([
            newPasslbl.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            newPasslbl.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24)
            
        ])
    }
    
    private func setUPNewPasslblTextField(){
        signInView.addSubview(newPasslblTextField)
        NSLayoutConstraint.activate([
            newPasslblTextField.topAnchor.constraint(equalTo: newPasslbl.bottomAnchor, constant: 6),
            newPasslblTextField.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            newPasslblTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -24),
            newPasslblTextField.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func setUpNewPassPreview(){
        signInView.addSubview(passPreviewBtn)
        NSLayoutConstraint.activate([
            passPreviewBtn.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -40),
            passPreviewBtn.centerYAnchor.constraint(equalTo: newPasslblTextField.centerYAnchor),
            passPreviewBtn.widthAnchor.constraint(equalToConstant: 24),
            passPreviewBtn.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    private func setUpForgotPassBtn(){
        signInView.addSubview(forgotPassBtn)
        NSLayoutConstraint.activate([
            forgotPassBtn.topAnchor.constraint(equalTo: newPasslblTextField.bottomAnchor, constant: 16),
            forgotPassBtn.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24)
        ])
    }
    
    private func setUpLoginButton(){
        signInView.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPassBtn.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setUpLabelButtonStack(){
        signInView.addSubview(labelButtonStack)
        NSLayoutConstraint.activate([
            labelButtonStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
            labelButtonStack.heightAnchor.constraint(equalToConstant: 20),
            labelButtonStack.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor)
        ])
    }
    
    private func setUpOrWithLbl(){
        signInView.addSubview(orWithLbl)
        signInView.addSubview(leftLineView)
        signInView.addSubview(rightLineView)
        
        NSLayoutConstraint.activate([
            orWithLbl.topAnchor.constraint(equalTo: labelButtonStack.bottomAnchor, constant: 26),
            orWithLbl.centerXAnchor.constraint(equalTo: labelButtonStack.centerXAnchor),
            
            leftLineView.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 0),
            leftLineView.centerYAnchor.constraint(equalTo: orWithLbl.centerYAnchor),
            leftLineView.trailingAnchor.constraint(equalTo: orWithLbl.leadingAnchor, constant: -7),
            leftLineView.heightAnchor.constraint(equalToConstant: 1),
            
            rightLineView.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: 0),
            rightLineView.centerYAnchor.constraint(equalTo: orWithLbl.centerYAnchor),
            rightLineView.leadingAnchor.constraint(equalTo: orWithLbl.trailingAnchor, constant: 7),
            rightLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    
    private func setUpGoogleView(){
        signInView.addSubview(googleView)
        NSLayoutConstraint.activate([
            googleView.topAnchor.constraint(equalTo: orWithLbl.bottomAnchor, constant: 24),
            googleView.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            googleView.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -24),
            googleView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setUpGoogleViewButton(){
        googleView.addSubview(googleViewButton)
        NSLayoutConstraint.activate([
            googleViewButton.leadingAnchor.constraint(equalTo: googleView.leadingAnchor, constant: 0),
            googleViewButton.trailingAnchor.constraint(equalTo: googleView.trailingAnchor, constant: 0),
            googleViewButton.topAnchor.constraint(equalTo: googleView.topAnchor, constant: 0),
            googleViewButton.bottomAnchor.constraint(equalTo: googleView.bottomAnchor, constant: 0),
        ])
    }
    
    private func setUpGoogleSubView(){
        googleView.addSubview(googleSubView)
        googleSubView.addSubview(googleImage)
        googleSubView.addSubview(signInWithGooglelbl)
        NSLayoutConstraint.activate([
            googleSubView.centerXAnchor.constraint(equalTo: googleView.centerXAnchor),
            googleSubView.centerYAnchor.constraint(equalTo: googleView.centerYAnchor),
            googleSubView.heightAnchor.constraint(equalToConstant: 48),
            
            googleImage.centerYAnchor.constraint(equalTo: googleSubView.centerYAnchor),
            googleImage.leadingAnchor.constraint(equalTo: googleSubView.leadingAnchor, constant: 0),
            googleImage.widthAnchor.constraint(equalToConstant: 16),
            googleImage.heightAnchor.constraint(equalToConstant: 16),
            
            signInWithGooglelbl.leadingAnchor.constraint(equalTo: googleImage.trailingAnchor, constant: 16),
            signInWithGooglelbl.centerYAnchor.constraint(equalTo: googleImage.centerYAnchor),
            signInWithGooglelbl.trailingAnchor.constraint(equalTo: googleSubView.trailingAnchor, constant: 0),

        ])
    }
    
    
    private func setUpAppleView(){
        signInView.addSubview(appleView)
        NSLayoutConstraint.activate([
            appleView.topAnchor.constraint(equalTo: googleView.bottomAnchor, constant: 8),
            appleView.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 24),
            appleView.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -24),
            appleView.bottomAnchor.constraint(equalTo: signInView.bottomAnchor, constant: 0),
            appleView.heightAnchor.constraint(equalToConstant: 48),
           
        ])
    }
    
    
    private func setUPAppleViewButton(){
        appleView.addSubview(appleViewButton)
        NSLayoutConstraint.activate([
            appleViewButton.leadingAnchor.constraint(equalTo: appleView.leadingAnchor, constant: 0),
            appleViewButton.trailingAnchor.constraint(equalTo: appleView.trailingAnchor, constant: 0),
            appleViewButton.topAnchor.constraint(equalTo: appleView.topAnchor, constant: 0),
            appleViewButton.bottomAnchor.constraint(equalTo: appleView.bottomAnchor, constant: 0),
        ])
    }
    
    private func setUpAppleSubView(){
        appleView.addSubview(appleSubView)
        appleSubView.addSubview(appleImage)
        appleSubView.addSubview(signInWithApplelbl)
        NSLayoutConstraint.activate([
            appleSubView.centerXAnchor.constraint(equalTo: appleView.centerXAnchor),
            appleSubView.centerYAnchor.constraint(equalTo: appleView.centerYAnchor),
            appleSubView.heightAnchor.constraint(equalToConstant: 48),
            
            appleImage.centerYAnchor.constraint(equalTo: appleSubView.centerYAnchor),
            appleImage.leadingAnchor.constraint(equalTo: appleSubView.leadingAnchor, constant: 0),
            appleImage.widthAnchor.constraint(equalToConstant: 16),
            appleImage.heightAnchor.constraint(equalToConstant: 16),
            
            signInWithApplelbl.leadingAnchor.constraint(equalTo: appleImage.trailingAnchor, constant: 16),
            signInWithApplelbl.centerYAnchor.constraint(equalTo: appleImage.centerYAnchor),
            signInWithApplelbl.trailingAnchor.constraint(equalTo: appleSubView.trailingAnchor, constant: 0),

        ])
    }
   
}


