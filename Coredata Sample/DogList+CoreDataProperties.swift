//
//  DogList+CoreDataProperties.swift
//  Coredata Sample
//
//  Created by gowri anguraj on 10/01/20.
//  Copyright © 2020 gowri anguraj. All rights reserved.
//
//
import Foundation
import CoreData

extension DogList {

    @nonobjc public class func createFetchRequest()-> NSFetchRequest<DogList> {
        return NSFetchRequest<DogList>(entityName: "DogList")
    }

    @NSManaged public var dogDescription: String?
    @NSManaged public var dogName: String?
    @NSManaged public var owner: String?
    @NSManaged public var dogImage: Data?

}
