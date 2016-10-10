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
      
    //MARKER: Create an Employee. Change the entrant type to test different entrants and their access. Leave values blank to test error handling
    let employee1 = Employee(firstName: "Vernon", lastName: "Reston", streetAddress: "Lincoln", city: "Pelham", state: "NY", zipCode: 10804, dateOfBirth: createBirthday(month: 3, day: 24, year: 1990), entrantType: .Manager)
    do{
        try createPass(entrant: employee1)
       
        //MARKER: Swipe method. Change Area parameter to test various access
        accessSwipe(entrant: employee1, area: .Office)
        
    } catch InputError.FullNameNotProvided{
    print("Error: Please Give Full Name")
    }catch InputError.FullAddressNotProvided{
    print("Error: Please Provide a Full Address")
    }catch InputError.ChildOlderThanFive {
    print("Error: Child must be at least 5 years old")
    }
    catch {
    print("Something Went Wrong")
    }
    //print("\(employee1.firstName) is \(getAge(date: employee1.dateOfBirth)) years old! \n ----------------------- \n")
        
   
        
        
    //MARKER: Create a Guest. Change the entrant type to test different entrants and their access. Change birthday value to test error handling
    let guest1 = Guest(firstName: "Frankie", lastName: "Smith", streetAddress: " ", city: " ", state: "NY", zipCode: 10801, dateOfBirth: createBirthday(month: 5, day: 23, year: 1994), entrantType: .FreeChildGuest)
    do{
        try createPass(entrant: guest1)
        
        //MARKER: Swipe method. Change Area parameter to test various access
        accessSwipe(entrant: guest1, area: .Kitchen)
    } catch InputError.FullNameNotProvided{
        print("Error: Please Give Full Name")
    }catch InputError.FullAddressNotProvided{
        print("Error: Please Provide a Full Address")
    }catch InputError.ChildOlderThanFive {
        print("Error: Child must be under 5 years old")
    }
    catch {
        print("Something Went Wrong")
    }
    //print("\(guest1.firstName) is \(getAge(date: guest1.dateOfBirth)) years old!")
    
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

