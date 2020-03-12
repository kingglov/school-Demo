//
//  ViewController.swift
//  SchoolDemo
//
//  Created by Madhukar on 06/03/2020.
//  Copyright © 2020 sailaja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    @IBAction func loginPressed(_ sender: UIButton) {
//        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
//           self.navigationController?.pushViewController(destinationVC, animated: true)
        print("hiiiiiiiiiiiiiii")
    }
    
}

