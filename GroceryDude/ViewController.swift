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
        let newItemNames:[String] = ["Apples", "Milk", "Bread", "Cheese", "Sausages", "Butter", "Orange Juice", "Cereal", "Coffee", "Eggs", "Tomatoes", "Fish"]
        
        let appDelegate:AppDelegate? = UIApplication.sharedApplication().delegate as? AppDelegate
        
        for name in newItemNames {
            let item:Item = NSEntityDescription.insertNewObjectForEntityForName("Item", inManagedObjectContext: (appDelegate?.cdh.context)!) as! Item
            
            item.name = name
        }
        
        appDelegate?.cdh.saveContext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

