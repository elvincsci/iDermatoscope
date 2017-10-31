//
//  ViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/30/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        //Google sign in button
        setupGoogle()

        
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(forgotPassswordButton)
        view.addSubview(registerButton)

        
        setupInputsContainerView()
        setupLoginButton()
        setuprForgotPasswordButton()
        setupregisterButton()
        
        
    }
    
    
    // View and buttons
    
    lazy var registerButton: UIButton = {

        let button = UIButton(type: .system)

       let yourAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18),
           NSAttributedStringKey.foregroundColor : UIColor.black,
           NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
    
        let attributeString = NSMutableAttributedString(string: "Register",
                                                        attributes: yourAttributes)
        
        button.setAttributedTitle(attributeString, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        button.addTarget(self, action: #selector(handleregister), for: .touchUpInside)
        
        return button
    }()
    
    //Login button
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    
    //
    lazy var forgotPassswordButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor.white
        button.setTitle("Forgot Password ?", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleForgotPasssword), for: .touchUpInside)
        
        return button
    }()

    //
//    lazy var forgotButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor.white
//        button.setTitle("Forgot Password?", for: UIControlState())
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitleColor(UIColor.black, for: UIControlState())
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//
//        button.addTarget(self, action: #selector(handleforgot), for: .touchUpInside)
//
//        return button
//    }()
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Password UITextField
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    

    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    //Functions
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupInputsContainerView(){
        
        //need x, y, width, height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: +50).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
        inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        
        //need x, y, width, height constraints
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        emailTextFieldHeightAnchor?.isActive = true
        
        //need x, y, width, height constraints
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //need x, y, width, height constraints
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSeparatorView.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        passwordTextFieldHeightAnchor?.isActive = true
    
    }

    
    func setupLoginButton() {
        //need x, y, width, height constraints
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 14).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupregisterButton() {
        //need x, y, width, height constraints
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        //need to figure out how to just set text
       // registerButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -150).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setuprForgotPasswordButton() {
        //need x, y, width, height constraints
        forgotPassswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forgotPassswordButton.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50).isActive = true
        //need to figure out how to just set text
        // registerButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, constant: -150).isActive = true
        forgotPassswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func setupGoogle(){
        
        let googleButton = GIDSignInButton()
        
        googleButton.frame = CGRect(x: 14, y: 116 + 90 , width: view.frame.width - 32, height: 50)
        //googleButton.frame = CGRect(x: 14, y: 116 + 66 + 66, width: view.frame.width - 32, height: 50)
        
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        googleButton.style = .wide
 
    }
    
    
    //Handle event controller
    @objc fileprivate func handleLogin(){
        
        print("Login Manually")
        
    }
    
    @objc fileprivate func handleregister() {
        
        print("Register")
        
    
        
        let loginController = RegisterViewController()
        present(loginController, animated: true, completion: nil)
        


    }
    
    //
    @objc fileprivate func handleforgot() {
        
        
    }
    
    //Forgot password
    @objc fileprivate func handleForgotPasssword() {
        
        
        
    }
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

