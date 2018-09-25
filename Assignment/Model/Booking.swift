//
//  Booking.swift
//  Assignment
//
//  Created by XIAOHAN ZENG on 2018/9/15.
//  Copyright © 2018年 Wenpeng Jiang. All rights reserved.
//


import UIKit

class Booking {
    var movie: Movie
    var location: String
    var time: String
    var price: String
    var noAdult: Int
    var noStudent: Int
    var noChild: Int
    static var bookings = [Booking]()

    
    init(movie:Movie, location:String, time:String, price: String, noAdult: Int, noStudent: Int, noChild: Int) {
        self.movie = movie
        self.location = location
        self.time = time
        self.price = price
        self.noAdult =  noAdult
        self.noStudent = noStudent
        self.noChild = noChild
    }
    
    static func getAllBooking() -> [Booking] {
        
        
        
        return bookings
    }
    
    
    
}
