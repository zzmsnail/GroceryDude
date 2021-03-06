//
//  Item+CoreDataProperties.swift
//  GroceryDude
//
//  Created by zhimingzhou on 16/4/22.
//  Copyright © 2016年 zzm. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var name: String?
    @NSManaged var quantity: NSNumber?
    @NSManaged var photoData: NSData?
    @NSManaged var listed: NSNumber?
    @NSManaged var collected: NSNumber?

}
