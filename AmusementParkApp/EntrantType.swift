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
    case FullNameNotProvided
    case FullAddressNotProvided
    case ChildOlderThanFive
}

//MARKER: Different Access Areas
enum Areas{
    case Office
    case Kitchen
    case RideControl
    case Maintenance
}

//MARKER: Base Level Entrant Info
class Entrant: BasicEntrant{
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var dateOfBirth: Date
    var entrantType: EntrantPassTypes
    init(firstName:String, lastName:String, streetAddress:String, city:String, state:String, zipCode:Int, dateOfBirth:Date, entrantType: EntrantPassTypes){
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dateOfBirth = dateOfBirth
        self.entrantType = entrantType
    }
}

protocol BasicEntrant {
    var firstName: String { get set }
    var lastName: String { get set }
    var streetAddress: String { get set }
    var city: String { get set }
    var state: String { get set }
    var zipCode: Int { get set }
    var dateOfBirth: Date {get set}
    var entrantType: EntrantPassTypes {get set}
}

//MARKER: Guest and Employee Classes
class Guest: Entrant{
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dateOfBirth: Date, entrantType: EntrantPassTypes) {
        super.init(firstName:firstName, lastName:lastName, streetAddress:streetAddress, city:city, state:state, zipCode:zipCode, dateOfBirth:dateOfBirth, entrantType:entrantType)
    }
}

class Employee: Entrant{
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int, dateOfBirth: Date, entrantType: EntrantPassTypes) {
        super.init(firstName:firstName, lastName:lastName, streetAddress:streetAddress, city:city, state:state, zipCode:zipCode, dateOfBirth:dateOfBirth, entrantType:entrantType)
    }
}


//MARKER: Methods to create passes
func createPass(entrant: Entrant) throws{
        if ((entrant.firstName == " " || entrant.lastName == " ") && entrant is Employee) {
            throw InputError.FullNameNotProvided
        }
        if ((entrant.streetAddress == " " || entrant.city == " " || entrant.state == " ") && entrant is Employee){
            throw InputError.FullAddressNotProvided
        }
        if ((entrant.entrantType == .FreeChildGuest && getAge(date: entrant.dateOfBirth) > 5) && entrant is Guest) {
            throw InputError.ChildOlderThanFive
        }
        else {
        print("Name: \(entrant.firstName) \(entrant.lastName) \nPass Type: \(entrant.entrantType) \n   <--Area Access--> \nAll Ride Acces: \(entrant.entrantType.canAccessAllRides) \nSkip All Ride Lines: \(entrant.entrantType.canSkipLine)\nAmusment Area Access:\(entrant.entrantType.canAccessAmusementArea) \nKitchen Acces:\(entrant.entrantType.canAccessKitchen) \nOffice Access: \(entrant.entrantType.canAccessOfficeArea) \nRide Controlls Access: \(entrant.entrantType.canAccessRideControlls) \nMaintenance Area: \(entrant.entrantType.canAccessMaintenanceArea)\n   <--Discounts--> \nFood Discount: \(entrant.entrantType.foodDiscount)%\nMerchandise Discount: \(entrant.entrantType.merchandiseDiscount)% \n----------------------")
    }
}


//MARKER: Handle birthday data
func createBirthday(month: Int, day: Int, year: Int) -> Date{
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let components = NSDateComponents()
    components.year = year
    components.month = month
    components.day = day
    return calendar!.date(from: components as DateComponents)!
}

func getAge(date: Date) -> Int {
    let birthdayYear = NSCalendar.current.component(.year, from: date)
    let age = NSCalendar.current.component(.year, from: NSDate() as Date) - birthdayYear
    return age
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

//SWIPE METHODS
func accessSwipe(entrant: Entrant, area: Areas){
    if area == .Office && entrant.entrantType.canAccessOfficeArea != true {
        print("\(entrant.firstName), you do not have access to the \(Areas.Office)! Please contact customer support for more help  \n-------------\n\n")
    }
    else if area == .Maintenance && entrant.entrantType.canAccessMaintenanceArea != true {
        print("\(entrant.firstName), you do not have access to the \(Areas.Maintenance)! Please contact customer support for more help  \n-------------\n\n")
    }
    else if area == .RideControl && entrant.entrantType.canAccessRideControlls != true {
        print("\(entrant.firstName), you do not have access to the \(Areas.RideControl)! Please contact customer support for more help  \n-------------\n\n")
    }
    else if area == .Kitchen && entrant.entrantType.canAccessKitchen != true {
        print("\(entrant.firstName), you do not have access to the \(Areas.Kitchen)! Please contact customer support for more help \n-------------\n\n")
    }else{
        print("You have access. Welcome In! \(entrant.firstName)! \n----------------\n\n")
    }
}

