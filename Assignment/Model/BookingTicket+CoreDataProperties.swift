//
//  Booking+CoreDataProperties.swift
//  Assignment
//
//  Created by Wenpeng Jiang on 1/10/18.
//  Copyright © 2018 Wenpeng Jiang. All rights reserved.
//
//

import Foundation
import CoreData


extension BookingTicket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookingTicket> {
        return NSFetchRequest<BookingTicket>(entityName: "BookingTicket")
    }

    @NSManaged public var name: String?
    @NSManaged public var location: String?
    @NSManaged public var time: String?
    @NSManaged public var price: String?

}
