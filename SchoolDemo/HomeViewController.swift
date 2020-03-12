//
//  HomeViewController.swift
//  SchoolDemo
//
//  Created by Madhukar on 07/03/2020.
//  Copyright © 2020 sailaja. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var tableViewhiheight: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var image: CircleCard!
    
    let imagesArry = [UIImage(named: "WhatsApp Image 2020-01-05 at 8.31.23 PM"),UIImage(named: "WhatsApp Image 2020-01-05 at 8.47.14 PM")]
    let namesArray = ["Ganesh","Durga"]
    override func viewDidLoad() {
        tableViewhiheight.constant = 2 * 80
        width.constant = 0
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func profilePressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.width.constant = 200
            self.view.layoutIfNeeded()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! profileSlideMenu
        
        
        cell.profileImage.image = imagesArry[indexPath.row]
        cell.studentName.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        UIView.animate(withDuration: 0.5) {
            
            self.width.constant = 0
            self.image.image = self.imagesArry[indexPath.row]
            self.view.layoutIfNeeded()
            
        }
        
        
        
    }
    
}
