//
//  RegisterViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/31/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit

class RegisterViewController:  UINavigationController, UINavigationBarDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray
        
        let button = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 40, height: 40))
        button.backgroundColor = .red
        button.tintColor = .white
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(change), for: .touchUpInside)
        view.addSubview(button)
        
        navigationItem.title = "We're logged in"


        
        
        
    }
    @objc func  change() {
        let loginController = ViewController()
        present(loginController, animated: true, completion: nil)
        
    }
    @objc func handleBack() {

        let loginController = ViewController()
        present(loginController, animated: true, completion: nil)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
