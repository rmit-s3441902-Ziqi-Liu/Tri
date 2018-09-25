//
//  TimeViewController.swift
//  Assignment
//
//  Created by 刘子奇 on 2018/9/14.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var des: UILabel!
    
    let time = ["11:30 AM - 1:30 PM","2:30 PM - 4:30 PM","5:30 PM - 7:30 PM"]
    
    var getName = String()
    var getImage = UIImage()
    var getLocation = String()
    var getDes = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poster.image = getImage
        name.text! = getName
        location.text! = getLocation
        des.text! = getDes
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableViewCell", for: indexPath) as! TimeTableViewCell
        cell.time.text = time[indexPath.row]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let CheckOut = storyBoard.instantiateViewController(withIdentifier: "CheckOut") as! CheckOutViewController
        CheckOut.getImage = getImage
        CheckOut.getName = getName
        CheckOut.getLocation = getLocation
        CheckOut.getTime = time[indexPath.row]
        CheckOut.getDes = getDes
        self.navigationController?.pushViewController(CheckOut, animated: true)
    }

    
}
