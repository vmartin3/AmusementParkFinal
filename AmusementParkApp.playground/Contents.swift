import UIKit
import Foundation

//Entrant Enum to determine accessability and discounts
enum EntrantPassTypes: Discountable, AreaAccessability, RideAccessability{
    case ClassicGuest
    case VipGuest
    case FreeChildGuest
    case FoodServicesHourly
    case RideServicesHourly
    case MaintenanceHourly
    case Manager
    
    var foodDiscount: Double{
        switch self {
        case .ClassicGuest:
            return 0.00
        case .VipGuest:
            return 0.10
        case .FreeChildGuest:
            return 0.00
        case .FoodServicesHourly:
            return 0.15
        case .RideServicesHourly:
            return 0.15
        case .MaintenanceHourly:
            return 0.15
        case .Manager:
            return 0.25
        }
    }
    
    var merchandiseDiscount: Double{
        switch self {
        case .ClassicGuest:
            return 0.00
        case .VipGuest:
            return 0.20
        case .FreeChildGuest:
            return 0.00
        case .FoodServicesHourly:
            return 0.25
        case .RideServicesHourly:
            return 0.25
        case .MaintenanceHourly:
            return 0.25
        case .Manager:
            return  0.25
        }
    }
    
    var canAccessAllRides: Bool{
        switch self {
        case .ClassicGuest:
            return true
        case .VipGuest:
            return true
        case .FreeChildGuest:
            return true
        case .FoodServicesHourly:
            return true
        case .RideServicesHourly:
            return true
        case .MaintenanceHourly:
            return true
        case .Manager:
            return true
        }
    }
    
    var canSkipLine: Bool{
        switch self {
        case .ClassicGuest:
            return false
        case .VipGuest:
            return true
        case .FreeChildGuest:
            return false
        case .FoodServicesHourly:
            return false
        case .RideServicesHourly:
            return false
        case .MaintenanceHourly:
            return false
        case .Manager:
            return false
        }
    }
    
    var canAccessAmusementArea: Bool{
        switch self {
        case .ClassicGuest:
            return true
        case .VipGuest:
            return true
        case .FreeChildGuest:
            return true
        case .FoodServicesHourly:
            return true
        case .RideServicesHourly:
            return true
        case .MaintenanceHourly:
            return true
        case .Manager:
            return true
        }
    }
    
    var canAccessKitchen: Bool{
        switch self {
        case .ClassicGuest:
            return false
        case .VipGuest:
            return false
        case .FreeChildGuest:
            return false
        case .FoodServicesHourly:
            return true
        case .RideServicesHourly:
            return false
        case .MaintenanceHourly:
            return true
        case .Manager:
            return true
        }
    }
    
    var canAccessOfficeArea: Bool{
        switch self {
        case .ClassicGuest:
            return false
        case .VipGuest:
            return false
        case .FreeChildGuest:
            return false
        case .FoodServicesHourly:
            return false
        case .RideServicesHourly:
            return false
        case .MaintenanceHourly:
            return false
        case .Manager:
            return true
        }
    }
    
    var canAccessMaintenanceArea: Bool{
        switch self {
        case .ClassicGuest:
            return false
        case .VipGuest:
            return false
        case .FreeChildGuest:
            return false
        case .FoodServicesHourly:
            return false
        case .RideServicesHourly:
            return false
        case .MaintenanceHourly:
            return true
        case .Manager:
            return true
        }
    }
    
    var canAccessRideControlls: Bool{
        switch self {
        case .ClassicGuest:
            return false
        case .VipGuest:
            return false
        case .FreeChildGuest:
            return false
        case .FoodServicesHourly:
            return false
        case .RideServicesHourly:
            return true
        case .MaintenanceHourly:
            return true
        case .Manager:
            return true
        }
    }
    
}

//MARKER: Error Handling
enum InputError: Error{
    case NoDateOfBirthProvided
    case FullNameNotProvided(required: String)
    case FullAddressNotProvided(required: String)
    case ChildOlderThanFive
}


//MARKER: Guest Helper Info
protocol Guest {
    var DateOfBirth: Int? { get set}
    var firstName: String? { get set }
    var lastName: String? { get set }
    var streetAddress: String? { get set }
    var city: String? { get set }
    var state: String? { get set }
    var zipCode: Int? { get set }
    var type: EntrantPassTypes {get set}
}

struct GuestEntrant: Guest{
    var DateOfBirth: Int?
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: Int?
    var type: EntrantPassTypes
}

func createGuestPass(entrant: GuestEntrant) throws{
             print("Employee Name: \(entrant.firstName) \(entrant.lastName) \nPass Type: \(entrant.type) \n   <--Area Access--> \nAll Ride Acces: \(entrant.type.canAccessAllRides) \nSkip All Ride Lines: \(entrant.type.canSkipLine)\nAmusment Area Access:\(entrant.type.canAccessAmusementArea) \nKitchen Acces:\(entrant.type.canAccessKitchen) \nOffice Access: \(entrant.type.canAccessOfficeArea) \nRide Controlls Access: \(entrant.type.canAccessRideControlls) \nMaintenance Area: \(entrant.type.canAccessMaintenanceArea)\n   <--Discounts--> \nFood Discount: \(entrant.type.foodDiscount)%\nMerchandise Discount: \(entrant.type.merchandiseDiscount)% \n----------------------\n")
}

//MAKER: Employee Helper Info
protocol HourlyEmployee {
    var firstName: String { get set }
    var lastName: String { get set }
    var streetAddress: String { get set }
    var city: String { get set }
    var state: String { get set }
    var zipCode: String { get set }
    var type: EntrantPassTypes { get set}
}

struct EmployeeEntrant: HourlyEmployee{
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var type: EntrantPassTypes
}

func createEmployeePass(entrant: EmployeeEntrant) throws{
//    if entrant.firstName == " " || entrant.lastName == " " {
//        print("******************ERROR**************: ")
//        throw InputError.FullNameNotProvided
//        
//    }
    if entrant.streetAddress == " " || entrant.city == " " || entrant.state == " " || entrant.zipCode == " "{
        print("******************ERROR**************: ")
        throw InputError.FullAddressNotProvided(required: "You must provide a full address before continuing. Thanks!")
    }else{
        print("Entrant Name: \(entrant.firstName) \(entrant.lastName) \nPass Type: \(entrant.type) \n   <--Area Access--> \nAll Ride Acces: \(entrant.type.canAccessAllRides) \nSkip All Ride Lines: \(entrant.type.canSkipLine)\nAmusment Area Access:\(entrant.type.canAccessAmusementArea) \nKitchen Acces:\(entrant.type.canAccessKitchen) \nOffice Access: \(entrant.type.canAccessOfficeArea) \nRide Controlls Access: \(entrant.type.canAccessRideControlls) \nMaintenance Area: \(entrant.type.canAccessMaintenanceArea)\n   <--Discounts--> \nFood Discount: \(entrant.type.foodDiscount)%\nMerchandise Discount: \(entrant.type.merchandiseDiscount)% \n----------------------\n")
    }
}


//MARKER: Helper Protocols
protocol Discountable {
    var foodDiscount: Double { get }
    var merchandiseDiscount: Double { get}
}

protocol AreaAccessability {
    var canAccessAmusementArea: Bool { get }
    var canAccessKitchen: Bool { get }
    var canAccessRideControlls: Bool { get }
    var canAccessMaintenanceArea: Bool { get }
    var canAccessOfficeArea: Bool { get }
}

protocol RideAccessability {
    var canAccessAllRides: Bool { get }
    var canSkipLine: Bool { get }
}

func dateFormatter(){
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "MM/dd/yyyy"
    let date = NSDate()
    print(date.age)
}

func calculateAge(date: NSDate) -> Int {
    return date.age
}

extension NSDate {
    var age:Int {
        return NSCalendar.current.component(.year, from: NSDate() as Date)
    }
}

//SWIPE METHODS
func officeAccessSwipe(entrant: EmployeeEntrant){
    if entrant.type.canAccessOfficeArea != true {
        print("You do not have access to the office areas! Please contact customer support for more help")
    }else{
        print("Welcome into the office \(entrant.firstName)!")
    }
}

func officeAccessSwipe(entrant: GuestEntrant){
    if entrant.type.canAccessOfficeArea != true {
        print("You do not have access to the office areas! Please contact customer support for more help")
    }else{
        print("Welcome into the office \(entrant.firstName)!")
    }
}



//MARKER: CREATE ENTRANTS

let manager = EmployeeEntrant(firstName: "Vernon", lastName: "Martin", streetAddress: "262 Webster Avenue", city: "New Rochelle", state: "NY", zipCode: "10801", type: .Manager)
do{
    try createEmployeePass(entrant: manager)
} catch{
    print(InputError.FullNameNotProvided)
}

//*********This entrant has a missing plug value that will throw an error please uncomment to test*********
//let maintenanceEmployee = EmployeeEntrant(firstName: " ", lastName: "Jack", streetAddress: "262 Dripler Avenue", city: "New Rochelle", state: "NY", zipCode: "10801", type: .MaintenanceHourly)
//do{
//    try createEmployeePass(entrant: maintenanceEmployee)
//} catch{
//    print(InputError.FullNameNotProvided)
//}

let maintenanceEmployee = EmployeeEntrant(firstName: "Bob", lastName: "Jacky", streetAddress: " ", city: " ", state: "NY", zipCode: "10801", type: .MaintenanceHourly)
do{
    try createEmployeePass(entrant: maintenanceEmployee)
} catch{
    //print(InputError.FullAddressNotProvided(required: "You must provide a full address before continuing. Thanks!"))
}

let rideServicesEmployee = EmployeeEntrant(firstName: "Sam", lastName: "Smith", streetAddress: "231 Cribster Avenue", city: "New Rochelle", state: "NY", zipCode: "10801", type: .RideServicesHourly)
do{
    try createEmployeePass(entrant: rideServicesEmployee)
} catch{
    print(InputError.FullNameNotProvided)
}

let foodServicesEmployee = EmployeeEntrant(firstName: "Eric", lastName: "Taylor", streetAddress: "32 Jonston Avenue", city: "New Rochelle", state: "NY", zipCode: "10801", type: .FoodServicesHourly)
do{
    try createEmployeePass(entrant: foodServicesEmployee)
} catch{
    print(InputError.FullNameNotProvided)
}

let classicGuest = GuestEntrant(DateOfBirth: calculateAge(date: NSDate()), firstName: "Frank", lastName: "Smith", streetAddress: "243 Broad St" , city: "Wester", state: "NY", zipCode: 8213, type: .ClassicGuest)
do{
try createGuestPass(entrant: classicGuest)
} catch{
    print(InputError.FullNameNotProvided)
}

let vipGuest = GuestEntrant(DateOfBirth: calculateAge(date: NSDate()), firstName: "Evan", lastName: "Lifty", streetAddress: "21 Ivan St" , city: "Wester", state: "NY", zipCode: 8213, type: .VipGuest)
do{
    try createGuestPass(entrant: vipGuest)
} catch{
    print(InputError.FullNameNotProvided)
}

let freeChild = GuestEntrant(DateOfBirth: calculateAge(date: NSDate()), firstName: "Shark", lastName: "Nado", streetAddress: "23 Friendly St" , city: "Wester", state: "NY", zipCode: 8213, type: .FreeChildGuest)
do{
    try createGuestPass(entrant: freeChild)
} catch{
    print(InputError.FullNameNotProvided)
}


//MARKER: SWIPE METHODS
officeAccessSwipe(entrant: manager)
officeAccessSwipe(entrant: vipGuest)
