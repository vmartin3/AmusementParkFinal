//
//  CreatePass.swift
//  AmusementParkAppGUI
//
//  Created by Vernon G Martin on 11/27/16.
//  Copyright © 2016 Vernon G Martin. All rights reserved.
//

import UIKit

class CreatePass: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var passType: UILabel!
    @IBOutlet weak var featureOne: UILabel!
    @IBOutlet weak var featureTwo: UILabel!
    @IBOutlet weak var featureThree: UILabel!
    @IBOutlet weak var testResultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second VC, first name: \(ViewController.entrant.firstName)")
        userName.text = ViewController.entrant.firstName
        passType.text = ViewController.entrant.entrantType.passType
        featureOne.text = "•\(String (ViewController.entrant.entrantType.foodDiscount))% Food Discount"
        featureTwo.text = "•\(String (ViewController.entrant.entrantType.merchandiseDiscount))% Merchandise Discount"
        if ViewController.entrant.entrantType.canAccessAllRides == false{
            featureThree.text = "•Can Access All Rides"
        }else{
            featureThree.text = "•Cannot Access All Rides"
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func areaAccessPressed(_ sender: AnyObject) {
        testResultText.text = "•Kitchen Access: \(ViewController.entrant.entrantType.canAccessKitchen)  \n •Office Access: \(ViewController.entrant.entrantType.canAccessOfficeArea) \n •Maintenance Access: \(ViewController.entrant.entrantType.canAccessMaintenanceArea)"
    }
 
    @IBAction func rideAccessPressed(_ sender: AnyObject) {
        testResultText.text = "•Can Access All Rides: \(ViewController.entrant.entrantType.canAccessAllRides)"
    }
    
    
    @IBAction func discountAccessPressed(_ sender: AnyObject) {
        testResultText.text = "•Food Discount: \(ViewController.entrant.entrantType.foodDiscount)% \n •Merchandise Discount: \(ViewController.entrant.entrantType.merchandiseDiscount)%"
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
