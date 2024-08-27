//
//  Profiles+CoreDataProperties.swift
//  M22.2
//
//  Created by Илья Иванов on 24.08.2024.
//
//

import Foundation
import CoreData


extension Profiles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profiles> {
        return NSFetchRequest<Profiles>(entityName: "Profiles")
    }

    @NSManaged public var country: String?
    @NSManaged public var dateOfBirth: String?
    @NSManaged public var name: String?
    @NSManaged public var surname: String?

}

extension Profiles : Identifiable {

}
