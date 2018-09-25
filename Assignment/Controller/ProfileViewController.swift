//
//  ViewController.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 10/9/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    var menuItem:[String] = ["MyBookings"];
    //var getUsername = String()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count;
    }
    
    @IBAction func LogoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
        UserDefaults.standard.synchronize();
        self.performSegue(withIdentifier: "LogoutView", sender: self);
    }
    
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ProfileTableViewCell;
        mycell.menuItemLable.text = menuItem[indexPath.row];
        return mycell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text! = "Email: " + LoginViewController.GlobalVariable.username
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let MyBooking = storyBoard.instantiateViewController(withIdentifier: "MyBooking") as! MyBookingViewController
        self.navigationController?.pushViewController(MyBooking, animated: true)
    }
}

