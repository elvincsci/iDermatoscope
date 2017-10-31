//
//  SettingViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/30/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit

class SettingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Settings"

        collectionView?.backgroundColor = UIColor.gray

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
