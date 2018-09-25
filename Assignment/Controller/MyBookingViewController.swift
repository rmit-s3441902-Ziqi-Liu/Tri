//
//  MyBookingViewController.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/16.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class MyBookingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Booking.bookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBookingTableViewCell", for: indexPath) as! MyBookingTableViewCell
        cell.movie.text! = Booking.getAllBooking()[indexPath.row].movie.name
        cell.location.text! = Booking.getAllBooking()[indexPath.row].location
        cell.time.text! = Booking.getAllBooking()[indexPath.row].time
        cell.price.text! = Booking.getAllBooking()[indexPath.row].price
        return cell
    }
    
    
    
    
    
}
