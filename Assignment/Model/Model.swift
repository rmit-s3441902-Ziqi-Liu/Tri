//
//  Model.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 1/10/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Model {
    static let sharedInstance = Model()
    
    var bookingDB = [BookingTicket]()
    
    let managedContext: NSManagedObjectContext
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private init() {
        managedContext = appDelegate.persistentContainer.viewContext
        getBookingFromCoreData()
    }
    
    func updateDatabse() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteBooking(_ indexPath: IndexPath) {
        let booking = bookingDB[indexPath.item]
        bookingDB.remove(at: indexPath.item)
        managedContext.delete(booking)
        updateDatabse()
    }
    
    func getBookingFromCoreData() {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookingTicket")
            let results = try managedContext.fetch(fetchRequest)
            bookingDB = results as! [BookingTicket]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveBooking(booking_name: String, booking_location: String, booking_time: String, booking_price: String) {
        let entity = NSEntityDescription.entity(forEntityName: "BookingTicket", in: managedContext)
//        if let _ = existing {
//            existing!.name = booking_name
//            existing!.location = booking_location
//            existing!.time = booking_time
//            existing!.price = booking_price
//        } else {
            let booking = NSManagedObject(entity: entity!, insertInto: managedContext) as! BookingTicket
            booking.setValue(booking_name, forKey: "name")
            booking.setValue(booking_location, forKey: "location")
            booking.setValue(booking_time, forKey: "time")
            booking.setValue(booking_price, forKey: "price")
            
            bookingDB.append(booking)
//        }
        updateDatabse()
    }
    
    func getBooking(_ indexPath: IndexPath) -> BookingTicket{
            return bookingDB[indexPath.row]
    }
}
