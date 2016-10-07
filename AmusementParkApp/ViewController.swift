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
            print("************SWIPE ATTEMPT FAILED************: \n Please Give Full Name")
        }catch InputError.FullAddressNotProvided{
            print("Please Provide a Full Address")
        }catch InputError.NoDateOfBirthProvided{
            print("Please Provide a Date of Birth")
        }catch InputError.ChildOlderThanFive {
            print("Child must be at least 5 years old")
        }
        catch {
            print("Something Went Wrong")
        }
        
        do{
            try officeAccessSwipe(entrant: manager)
        } catch AccessDenied.NoAccess {
            print("You do not have access into the office Area!")
        } catch {
            print("Something went wrong")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

