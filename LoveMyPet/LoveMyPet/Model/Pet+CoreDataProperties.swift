//
//  Pet+CoreDataProperties.swift
//  LoveMyPet
//
//  Created by userext on 01/08/23.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var date: Date?
    @NSManaged public var castrated: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var imagepath: URL?
    @NSManaged public var name: String?
    @NSManaged public var race: String?
    @NSManaged public var registered: Bool
    @NSManaged public var species: String?
    @NSManaged public var weight: Float

}

extension Pet : Identifiable {

}
