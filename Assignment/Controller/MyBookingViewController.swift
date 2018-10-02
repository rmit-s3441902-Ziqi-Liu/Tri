//
//  MyBookingViewController.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/16.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class MyBookingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    var bookingDb = Model.sharedInstance.bookingDB
    var model = Model.sharedInstance
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookingDb.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBookingTableViewCell", for: indexPath) as! MyBookingTableViewCell
       
        let currentBooking = bookingDb[indexPath.item]
        
        let textName = cell.viewWithTag(1000) as! UILabel
        let textLocation = cell.viewWithTag(1001) as! UILabel
        let textTime = cell.viewWithTag(1002) as! UILabel
        let textPrice = cell.viewWithTag(1003) as! UILabel
        
        textName.text = currentBooking.name
        textLocation.text = currentBooking.location
        textTime.text = currentBooking.time
        textPrice.text = currentBooking.price
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        model.deleteBooking(indexPath)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
