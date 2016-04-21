//
//  CoreDataHelper.swift
//  GroceryDude
//
//  Created by zzm on 16/4/20.
//  Copyright © 2016年 zzm. All rights reserved.
//

import Foundation
import CoreData

let debug = 1
let storeFileName = "GroceryDude.sqlite"

public class CoreDataHelper {
    enum Error: ErrorType {
        case LoadFailed
    }
    
    var context:NSManagedObjectContext!
    var model:NSManagedObjectModel?
    var coordinator:NSPersistentStoreCoordinator?
    var store:NSPersistentStore? = nil
    
    init() {
        model = NSManagedObjectModel.mergedModelFromBundles(nil)
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
        context = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
    }
    
    @objc private func applicationDocumentsDirectory() -> String {
        if debug == 1 {
            print("Running \(self.desc()) '\(NSStringFromSelector(#selector(applicationDocumentsDirectory)))'")
        }
        let paths:NSArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,  NSSearchPathDomainMask.UserDomainMask, true) as NSArray
        
        return paths.lastObject as! String
    }
    
    @objc private func applicationStoreDirectory() -> NSURL {
        if debug == 1 {
            print("Running \(self.desc()) '\(NSStringFromSelector(#selector(applicationStoreDirectory)))'")
        }
        
        let storeDirectory:NSURL = NSURL(fileURLWithPath: self.applicationDocumentsDirectory()).URLByAppendingPathComponent("Stores")
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(storeDirectory.path!) {
            try! fileManager.createDirectoryAtURL(storeDirectory, withIntermediateDirectories: true, attributes: nil)
        }
        
        
        return storeDirectory
    }
    
    func desc() -> NSString {
        return "CoreDataHelper"
    }
    
    private func storeURL() -> NSURL {
        return self.applicationStoreDirectory().URLByAppendingPathComponent(storeFileName)
    }
    
    func setupCoreData() {
        self.loadStore()
    }
    
    func loadStore() {
        if (self.store != nil) {
            return
        }
        
        do {
            self.store = try self.coordinator?.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: self.storeURL(), options: nil)
        }
        catch {
            print("loadStore failed")
        }
    }
    
    func saveContext() {
        if self.context.hasChanges {
            do {
                try self.context.save()
            }
            catch {
                print("save failed")
            }
        }
    }
}