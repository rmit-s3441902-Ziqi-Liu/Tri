//
//  CheckOutViewController.swift
//  Assignment
//
//  Created by 刘子奇 on 2018/9/14.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var adult: UITextField!
    @IBOutlet weak var children: UITextField!
    @IBOutlet weak var student: UITextField!
    
    @IBOutlet weak var des: UILabel!
    
    @IBAction func checkOut(_ sender: Any) {
        self.view.addSubview(Popover)
        Popover.center = self.view.center
    }
    
    @IBAction func adultNum(_ sender: Any) {
        let number1 = Int(adult.text!)
        let number2 = Int(children.text!)
        let number3 = Int(student.text!)
        if number1 != nil && number2 != nil && number3 != nil{
            let totalPrice = number1!*20 + number2!*10 + number3!*10
            total.text = String("\(totalPrice)")}
    }
    
    @IBOutlet var Popover: UIView!
    
    @IBAction func yes(_ sender: Any) {
        let movie = Movie(name: getName, description: getDes)
        let booking = Booking(movie: movie,location: getLocation,time: getTime,price: total.text!,noAdult: Int(adult.text!)!,noStudent: Int(student.text!)!,noChild: Int(children.text!)!)
        Booking.bookings.append(booking)
        
      
        Model.sharedInstance.saveBooking(booking_name: "getName", booking_location: "getLocation", booking_time: "getTime", booking_price: total.text!)
            
        
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let Feature = storyBoard.instantiateViewController(withIdentifier: "Feature") as! FeaturedViewController
        self.navigationController?.pushViewController(Feature, animated: true)
    }
    
    
    @IBAction func no(_ sender: Any) {
        self.Popover.removeFromSuperview()
    }
    
    var getName = String()
    var getImage = UIImage()
    var getLocation = String()
    var getTime = String()
    var getDes = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poster.image = getImage
        name.text! = getName
        location.text! = getLocation
        time.text! = getTime
        des.text! = getDes
        
        total.text! = "0"
        adult.text! = "0"
        children.text! = "0"
        student.text! = "0"
        
        adult.delegate = self
        children.delegate = self
        student.delegate = self
        
        self.Popover.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,replacementString string: String )-> Bool {
        let allowedCharaters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharaters)
        let typedCharacterSet = CharacterSet(charactersIn:string)
        return allowedCharacterSet.isSuperset(of:typedCharacterSet)
    }
    
    
    
}
