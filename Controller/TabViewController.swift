//
//  TabViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/30/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //HomePage
        let homeController = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.title = "HomePage"
        homeNavController.tabBarItem.image = UIImage(named: "house")


        
        
        let examRequestsController = ExamViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let examNavigationController = UINavigationController(rootViewController: examRequestsController)
        examNavigationController.title = "Exam"
        examNavigationController.tabBarItem.image = UIImage(named: "hospital")


        let settingsVC = SettingViewController(collectionViewLayout: UICollectionViewFlowLayout ())
        let settingsNavigationController = UINavigationController(rootViewController: settingsVC)
        settingsNavigationController.title = "More"
        settingsNavigationController.tabBarItem.image = UIImage(named: "more_icon")



        viewControllers = [homeNavController, examNavigationController,settingsNavigationController]

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
