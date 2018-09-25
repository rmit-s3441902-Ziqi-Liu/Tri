//
//  BookingDetailViewController.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 11/9/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var des: UILabel!
    
    var getName = String()
    var getImage = UIImage()
    var getDes = String()
    
    
    let location = ["Melbourne Central","Chadstone","Glen Waverley"]
    override func viewDidLoad() {
        super.viewDidLoad()
        poster.image = getImage
        name.text! = getName
        
    //        des.lineBreakMode = NSLineBreakMode.byWordWrapping
        des.text! = getDes
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        cell.address.text = location[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let bookingTime = storyBoard.instantiateViewController(withIdentifier: "BookingTime") as! TimeViewController
        bookingTime.getImage = getImage
        bookingTime.getName = getName
        bookingTime.getLocation = location[indexPath.row]
        bookingTime.getDes = getDes
        self.navigationController?.pushViewController(bookingTime, animated: true)
    }

}
