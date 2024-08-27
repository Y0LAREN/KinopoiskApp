import Foundation
import CoreData

protocol ListOfAllUsersPresenterProtocol {
  
  func numberOfSections() -> Int
  
  func numberOfRowInSection(_ section: Int) -> Int
  
  func nameForRow(at indexPath: IndexPath) -> String
  
  func surnameForRow(at indexPath: IndexPath) -> String
  
  func dateOfBirthdayForRow(at indexPath: IndexPath) -> String
  
  func countryForRow(at indexPath: IndexPath) -> String
  
  func didSelectUser(at indexPath: IndexPath) -> LoginViewController
  
  func changeSortDescriptor()
  
  func setSortDescriptor()
  
  func heightForHeaderInSection() -> CGFloat
  
  func loadPersistentContainer()
  
  func heightForRowAt() -> CGFloat
  
  func buttonForCreateTapped() -> LoginViewController
  
  func buttonForSortTableViewTapped()
  
  func userDelete(indexPath: IndexPath)
  
  func saveContext()
  
  func returnContext() -> NSManagedObjectContext
  
  func setFecthControllerDelegate(delegate: NSFetchedResultsControllerDelegate)
  
  func setView(_ view: ListOfAllUsersViewProtocol)
  
}
