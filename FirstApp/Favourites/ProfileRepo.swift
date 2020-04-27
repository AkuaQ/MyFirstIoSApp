//
//  Trying.swift
//  FirstApp
//
//  Created by Akua Afrane-Okese on 2020/04/27.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation
import CoreData

@objc public class ProfileRepo: NSObject {
    @objc(save:) public func save(name: NSData) {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        let managedContext =
          appDelegate.persistentContainer.viewContext
        let entity =
          NSEntityDescription.entity(forEntityName: "Camera",
                                     in: managedContext)!
        let photo = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        photo.setValue(name, forKeyPath: "photo")
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }

    @objc public func fetch() -> UIImage {
        var photos: [NSManagedObject] = []
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        let managedContext =
          appDelegate.persistentContainer.viewContext
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "Camera")
        do {
          photos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        if photos.isEmpty {
            return UIImage(named: "profile")!
        } else {
            return UIImage(data: (photos[photos.count - 1]
                .value(forKey: "photo") as? Data)!) ?? UIImage(named: "profile")!
        }
    }
}
