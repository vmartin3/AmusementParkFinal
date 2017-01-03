//
//  ViewController.swift
//  AmusementParkApp
//
//  Created by Vernon G Martin on 9/11/16.
//  Copyright © 2016 Vernon G Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let sharedInstance = ViewController()
    
    
    @IBOutlet weak var generatePass: UIButton!
    @IBOutlet weak var dateOfBirthField: UITextField!
    @IBOutlet weak var ssnField: UITextField!
    @IBOutlet weak var projectNumberField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var streetAddressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var dateVisitField: UITextField!
     @IBOutlet weak var vendorCompField: UITextField!
    
    @IBOutlet weak var employeeOptionsStack: UIStackView!
    @IBOutlet weak var guestOptionsStack: UIStackView!
    @IBOutlet weak var managerOptionsStack: UIStackView!
    @IBOutlet weak var contractorOptionsStack: UIStackView!
    @IBOutlet weak var vendorOptionsStack: UIStackView!
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var contractorButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    @IBOutlet weak var acmeVendor: UIButton!
    @IBOutlet weak var orkinVendor: UIButton!
    @IBOutlet weak var fedexVendor: UIButton!
    @IBOutlet weak var nwVendor: UIButton!
    
    @IBOutlet weak var foodEmpButton: UIButton!
    @IBOutlet weak var rideEmpButton: UIButton!
    @IBOutlet weak var maintenanceEmpButton: UIButton!
    @IBOutlet weak var contractEmpButton: UIButton!
    
    @IBOutlet weak var project1Button: UIButton!
    @IBOutlet weak var project2Button: UIButton!
    @IBOutlet weak var project3Button: UIButton!
    @IBOutlet weak var project4Button: UIButton!
    @IBOutlet weak var project5Button: UIButton!
    
    
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var adultButton: UIButton!
    @IBOutlet weak var seniorButton: UIButton!
    @IBOutlet weak var seasonPassButton: UIButton!
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var foo: UIButton!
    
    @IBOutlet weak var vendorCompLabel: UILabel!
    @IBOutlet weak var dateVisitLabel: UILabel!
    
    let datePicker = UIDatePicker()
    let datePickerTwo = UIDatePicker()
    
    static var entrant = Entrant(firstName: "", lastName: "", streetAddress: "", city: "", state: "", zipCode: 00000, dateOfBirth: createBirthday(month: 3, day: 24, year: 1993), entrantType: .FreeChildGuest)
    static var entrantAge = 0
    static var birthday: String = ""

    override func viewDidLoad() {
    super.viewDidLoad()
        
        datePicker.datePickerMode = UIDatePickerMode.date
        datePickerTwo.datePickerMode = UIDatePickerMode.date
        
        dateOfBirthField.inputView = datePicker
        dateVisitField.inputView = datePickerTwo
        
        datePicker.addTarget(self, action: #selector((self.dateOfBirthPicker(datePicker:))), for: UIControlEvents.valueChanged)
        datePickerTwo.addTarget(self, action: #selector((self.dateOfVisitPicker(datePicker:))), for: UIControlEvents.valueChanged)
    }
    
    //Controls birthday picker rotating wheels and respective UIText field
    func dateOfBirthPicker(datePicker:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        ViewController.birthday = dateFormatter.string(from: self.datePicker.date)
        let birthdayDate = self.datePicker.date
        dateOfBirthField.text = ViewController.birthday
        dateOfBirthField.textColor = UIColor.black
        ViewController.entrantAge = getAge(date: birthdayDate)
    }
    
    //Controls date of visit picker rotating wheels and respective UIText field
    func dateOfVisitPicker(datePicker:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let visitDate = dateFormatter.string(from: self.datePickerTwo.date)
        dateVisitField.text = visitDate
        dateVisitField.textColor = UIColor.black
    }
    
    //Populate the text fields with Dummy Data
    @IBAction func populateDataPressed(_ sender: AnyObject) {
        firstNameField.text = "Bobby"
        firstNameField.textColor = UIColor.black
        lastNameField.text = "Smith"
        lastNameField.textColor = UIColor.black
        streetAddressField.text = "324 Webster Ave"
        streetAddressField.textColor = UIColor.black
        cityField.text = "Brooklyn"
        cityField.textColor = UIColor.black
        zipCodeField.text = "10801"
        zipCodeField.textColor = UIColor.black
        stateField.text = "New York"
        stateField.textColor = UIColor.black
    }
    
    //Sets Fields based on options selected
    @IBAction func contractorOptionPressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        guestButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        employeeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        managerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        vendorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        ViewController.entrant.entrantType = .ContractEmployee
        guestOptionsStack.isHidden = true
        employeeOptionsStack.isHidden = true
        managerOptionsStack.isHidden = true
        vendorOptionsStack.isHidden = true
        contractorOptionsStack.isHidden = false
        
        vendorCompField.isHidden = true
        vendorCompLabel.isHidden = true
        dateVisitField.isHidden = true
        dateVisitLabel.isHidden = true
    }
    
    @IBAction func managerOptionPressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        guestButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        employeeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        contractorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        vendorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        ViewController.entrant.entrantType = .Manager
        guestOptionsStack.isHidden = true
        employeeOptionsStack.isHidden = true
        managerOptionsStack.isHidden = false
        vendorOptionsStack.isHidden = true
        contractorOptionsStack.isHidden = true
        
        vendorCompField.isHidden = true
        vendorCompLabel.isHidden = true
        dateVisitField.isHidden = true
        dateVisitLabel.isHidden = true
    }
    @IBAction func vendorOptionPressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        guestButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        employeeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        managerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        contractorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        ViewController.entrant.entrantType = .Vendor
        guestOptionsStack.isHidden = true
        employeeOptionsStack.isHidden = true
        managerOptionsStack.isHidden = true
        vendorOptionsStack.isHidden = false
        contractorOptionsStack.isHidden = true
        
        vendorCompField.isHidden = false
        vendorCompLabel.isHidden = false
        dateVisitField.isHidden = false
        dateVisitLabel.isHidden = false
    }
    @IBAction func employeePressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        ViewController.entrant.entrantType = .FoodServicesHourly
        guestButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        contractorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        managerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        vendorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        guestOptionsStack.isHidden = true
        employeeOptionsStack.isHidden = false
        managerOptionsStack.isHidden = true
        vendorOptionsStack.isHidden = true
        contractorOptionsStack.isHidden = true
        
        vendorCompField.isHidden = true
        vendorCompLabel.isHidden = true
        dateVisitField.isHidden = true
        dateVisitLabel.isHidden = true
    }
    
    @IBAction func guestOptionPressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        contractorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        employeeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        managerButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        vendorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        guestOptionsStack.isHidden = false
        employeeOptionsStack.isHidden = true
        managerOptionsStack.isHidden = true
        vendorOptionsStack.isHidden = true
        contractorOptionsStack.isHidden = true
        
        vendorCompField.isHidden = true
        vendorCompLabel.isHidden = true
        dateVisitField.isHidden = true
        dateVisitLabel.isHidden = true
        ViewController.entrant.entrantType = .ClassicGuest
    }

    @IBAction func childOptionPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        dateOfBirthField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .FreeChildGuest
    }
    
    @IBAction func adultOptionPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ClassicGuest
    }
    
    @IBAction func seniorOptionPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        dateOfBirthField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .SeniorGuest
    }
    @IBAction func seasonPassOptionPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
    }
    
    @IBAction func vipOptionPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .VipGuest
    }
    
    @IBAction func contractorPressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
   
    
    @IBAction func vendorEmployeePressed(_ sender: AnyObject) {
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        ViewController.entrant.entrantType = .Vendor
    }
    
    @IBAction func managerPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .Manager
    }
    
    @IBAction func foodSrvcPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .FoodServicesHourly
    }
    @IBAction func rideSrvcPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .RideServicesHourly
    }
    @IBAction func maintenanceSrvcPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .MaintenanceHourly
    }
    @IBAction func contractEmpPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func project1Pressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func project2Pressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func project3Pressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func project4Pressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func project5Pressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        streetAddressField.backgroundColor = UIColor.white
        cityField.backgroundColor = UIColor.white
        stateField.backgroundColor = UIColor.white
        zipCodeField.backgroundColor = UIColor.white
        ViewController.entrant.entrantType = .ContractEmployee
    }
    
    @IBAction func acmeVendorPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        dateOfBirthField.backgroundColor = UIColor.white
        dateVisitField.backgroundColor = UIColor.white
    }
    
    @IBAction func orkinVendorPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        dateOfBirthField.backgroundColor = UIColor.white
        dateVisitField.backgroundColor = UIColor.white
    }
    
    @IBAction func fedexVendorPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        dateOfBirthField.backgroundColor = UIColor.white
        dateVisitField.backgroundColor = UIColor.white
    }
    
    @IBAction func nwVendorPressed(_ sender: AnyObject) {
        resetFields()
        sender.setTitleColor(UIColor.red, for: UIControlState.normal)
        firstNameField.backgroundColor = UIColor.white
        lastNameField.backgroundColor = UIColor.white
        dateOfBirthField.backgroundColor = UIColor.white
        dateVisitField.backgroundColor = UIColor.white
    }
    
    //Resets the text fields
    func resetFields(){
        firstNameField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        lastNameField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        streetAddressField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        cityField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        stateField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        zipCodeField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        dateOfBirthField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        ssnField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        projectNumberField.backgroundColor = UIColor(colorLiteralRed: 215/255, green: 208/255, blue: 220/255, alpha: 1)
        
        childButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        adultButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        seniorButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        seasonPassButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        vipButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        foodEmpButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        rideEmpButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        maintenanceEmpButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        contractEmpButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        acmeVendor.setTitleColor(UIColor.white, for: UIControlState.normal)
        nwVendor.setTitleColor(UIColor.white, for: UIControlState.normal)
        fedexVendor.setTitleColor(UIColor.white, for: UIControlState.normal)
        orkinVendor.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        project1Button.setTitleColor(UIColor.white, for: UIControlState.normal)
        project2Button.setTitleColor(UIColor.white, for: UIControlState.normal)
        project3Button.setTitleColor(UIColor.white, for: UIControlState.normal)
        project4Button.setTitleColor(UIColor.white, for: UIControlState.normal)
        
    }
    
    //Attempts to generate a pass if the requirements for that entrant are met if not error message box will alert the user
    @IBAction func generatePassPressed(_ sender: AnyObject) {
        do{
            
        //Add GUARD STATEMENTS
            ViewController.entrant.firstName = firstNameField.text!
            ViewController.entrant.lastName = lastNameField.text!
            ViewController.entrant.streetAddress = streetAddressField.text!
            ViewController.entrant.city = cityField.text!
            ViewController.entrant.zipCode = Int (zipCodeField.text!)!
            ViewController.entrant.state = stateField.text!

            
            try createPass(entrant: ViewController.entrant)
            
        } catch InputError.FullNameNotProvided{
            let alert = UIAlertController(title: "Missing Information", message: "Please make sure first and last name fields are not blank", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }catch InputError.FullAddressNotProvided{
            let alert = UIAlertController(title: "Missing Information", message: "Please provide full address", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))

        }catch InputError.ChildOlderThanFive {
            let alert = UIAlertController(title: "Age Limit Not Met", message: "Child must be at least 5 years old", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        catch {
            print("Something Went Wrong")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


