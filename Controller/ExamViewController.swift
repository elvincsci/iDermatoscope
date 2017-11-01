//
//  ExamViewController.swift
//  iDermatoscope
//
//  Created by elvin on 10/30/17.
//  Copyright © 2017 elvin. All rights reserved.
//

import UIKit
import ALCameraViewController


class ExamViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Exam"
        
        
        let button = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 80, height: 40))
        button.backgroundColor = .red
        button.tintColor = .white
        button.setTitle("Camera", for: .normal)
        button.addTarget(self, action: #selector(change), for: .touchUpInside)
        view.addSubview(button)
        
        collectionView?.backgroundColor = UIColor.gray

        
        
    }
    
    @objc func  change() {
        
        let cameraViewController = CameraViewController { [weak self] image, asset in
            // Do something with your image here.
            self?.dismiss(animated: true, completion: nil)
        }
        
        present(cameraViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
