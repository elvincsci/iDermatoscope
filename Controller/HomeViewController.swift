//
//  HomeViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/30/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Home"

        collectionView?.backgroundColor = UIColor.gray

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(handleSelect))

        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSelect() {
    
        print("Select option")
        navigationItem.title = "Select Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))

    
    }
    
    @objc func  handleCancel() {
        
        print("Print cancel")
        navigationItem.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(handleSelect))
    }
    
    
    @objc func handleLogout() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        GIDSignIn.sharedInstance().signOut()
        
        let loginController = ViewController()
        present(loginController, animated: true, completion: nil)
        
    }


}
