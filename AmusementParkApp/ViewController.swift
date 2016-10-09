//
//  ViewController.swift
//  AmusementParkApp
//
//  Created by Vernon G Martin on 9/11/16.
//  Copyright © 2016 Vernon G Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = EmployeeEntrant(firstName: "Vernon", lastName: "Martin", streetAddress: "262 Webster Avenue", city: "New Rochelle", state: "NY", zipCode: "10801", type: .Manager)
        do{
            try createEmployeePass(entrant: manager)
        } catch InputError.FullNameNotProvided{
            print("Error: Please Give Full Name")
        }catch InputError.FullAddressNotProvided{
            print("Error: Please Provide a Full Address")
        }catch InputError.NoDateOfBirthProvided{
            print("Error: Please Provide a Date of Birth")
        }catch InputError.ChildOlderThanFive {
            print("Error: Child must be at least 5 years old")
        }
        catch {
            print("Something Went Wrong")
        }
        
        officeAccessSwipe(entrant: manager)
   
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

