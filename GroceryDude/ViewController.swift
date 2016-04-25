//
//  ViewController.swift
//  GroceryDude
//
//  Created by zzm on 16/4/20.
//  Copyright © 2016年 zzm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetch()
    }
    
    private func demo() {
        let appDelegate:AppDelegate? = UIApplication.sharedApplication().delegate as? AppDelegate
        
        for index in 0...50000 {
            let measurement:Measurement = NSEntityDescription.insertNewObjectForEntityForName("Measurement", inManagedObjectContext: (appDelegate?.cdh.context)!) as! Measurement
            measurement.abc = String.init(format: "-->> LOTS OF TEST DATA x%i", index)
        }
        
        appDelegate?.cdh.saveContext()
    }
    
    func fetch() -> [AnyObject] {
        let appDelegate:AppDelegate? = UIApplication.sharedApplication().delegate as? AppDelegate
        let fetchRequest:NSFetchRequest = NSFetchRequest(entityName: "Amount")
        fetchRequest.fetchLimit = 50
        let fetchObjects:[AnyObject]? = try! appDelegate?.cdh.context.executeFetchRequest(fetchRequest)
        for item in fetchObjects! {
            let object = item as? Amount
            print("\(object?.xyz)")
        }
        
        return fetchObjects!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

