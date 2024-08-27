//
//  CoreData.swift
//  M22.2
//
//  Created by Илья Иванов on 15.08.2024.
//

import Foundation
import UIKit
import CoreData

protocol CoreDataProtocol{
  
  var appDelegate: AppDelegate { get }
  
  var context: NSManagedObjectContext { get }
  
  var fetchedResultsController: NSFetchedResultsController<Profiles> { get set }
  
  func createUser(name: String?,surname: String?, dateOfBirth: String?, country: String?)
  
  func userDelete(indexPath: IndexPath, fetchedResultsController: NSFetchedResultsController<Profiles>)
  
  func saveContext()
  
  func returnContext() -> NSManagedObjectContext
  
}

final class CoreData: CoreDataProtocol{
  
  var appDelegate: AppDelegate{
    UIApplication.shared.delegate as! AppDelegate
  }
  
  var context: NSManagedObjectContext{
    appDelegate.persistentContainer.viewContext
  }
  
  lazy var fetchedResultsController: NSFetchedResultsController<Profiles> = {
    let fetchRequest = Profiles.fetchRequest()
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    let fetchedResultsController = NSFetchedResultsController(
      fetchRequest: fetchRequest,
      managedObjectContext: context,
      sectionNameKeyPath: nil,
      cacheName: nil)
    return fetchedResultsController
  }()
  
  func createUser(name: String?,surname: String?, dateOfBirth: String?, country: String?){
//    guard let userEntityDescription = NSEntityDescription.entity(forEntityName: "Profiles", in: context) else{
//      return
//    }
    let user = Profiles(context: context)
    user.name = name
    user.surname = surname
    user.dateOfBirth = dateOfBirth
    user.country = country
    
    saveContext()
  }
  
  func userDelete(indexPath: IndexPath, fetchedResultsController: NSFetchedResultsController<Profiles>) {
    let user = fetchedResultsController.object(at: indexPath)
    context.delete(user)
  }
  
  func saveContext() {
    appDelegate.saveContext()
  }
  
  func returnContext() -> NSManagedObjectContext {
    return context
  }
  
  
  
}
