//
//  Reports+CoreDataProperties.swift
//  
//
//  Created by Ghenadie Isacenco on 15/5/23.
//
//

import Foundation
import CoreData

extension Reports {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reports> {
        return NSFetchRequest<Reports>(entityName: "Reports")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var desc: String?

}
