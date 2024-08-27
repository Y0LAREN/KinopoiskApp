import Foundation
import CoreData

final class ListOfAllUsersPresenter: NSObject, ListOfAllUsersPresenterProtocol {
  
  var sortsPresenter: SortsPresenterProtocol = SortsPresenter()
  
  var coreData: CoreDataProtocol = CoreData()
  
  var closure: ((LoginViewController) -> Void)?
  
  var userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService()
  
  private weak var view: ListOfAllUsersViewProtocol?
  
  func setView(_ view: ListOfAllUsersViewProtocol) {
    self.view = view
  }
  
  func setFecthControllerDelegate(delegate: NSFetchedResultsControllerDelegate) {
    coreData.fetchedResultsController.delegate = delegate
  }
  
  func numberOfSections() -> Int {
    coreData.fetchedResultsController.sections?.count ?? 0
  }
  
  func numberOfRowInSection(_ section: Int) -> Int {
    if let sections = coreData.fetchedResultsController.sections {
      return sections[section].numberOfObjects
    }
    return 0
  }
  
  func heightForRowAt() -> CGFloat {
    100
  }
  
  func nameForRow(at indexPath: IndexPath) -> String {
    let user = coreData.fetchedResultsController.object(at: indexPath)
    return user.name ?? ""
  }
  
  func surnameForRow(at indexPath: IndexPath) -> String {
    let user = coreData.fetchedResultsController.object(at: indexPath)
    return user.surname ?? ""
  }
  
  func dateOfBirthdayForRow(at indexPath: IndexPath) -> String {
    let user = coreData.fetchedResultsController.object(at: indexPath)
    return user.dateOfBirth ?? ""
  }
  
  func countryForRow(at indexPath: IndexPath) -> String {
    let user = coreData.fetchedResultsController.object(at: indexPath)
    return user.country ?? ""
  }
  
  func didSelectUser(at indexPath: IndexPath) -> LoginViewController {
    let modelFetchedResultsController = coreData.fetchedResultsController.object(at: indexPath)
    let vc = LoginViewController(
      labelForName: modelFetchedResultsController.name ?? "",
      labelForSurname: modelFetchedResultsController.surname ?? "",
      labelForCountry: modelFetchedResultsController.dateOfBirth ?? "",
      labelForDateOfBirth: modelFetchedResultsController.country ?? "")
    
    vc.textFieldForName.text = modelFetchedResultsController.name
    vc.textFieldForSurname.text = modelFetchedResultsController.surname
    vc.textFieldForDateOfBirth.text = modelFetchedResultsController.dateOfBirth
    vc.textFieldForCountry.text = modelFetchedResultsController.country
    
    return vc
  }
  
  func changeSortDescriptor() {
    sortsPresenter.completion = { [weak self] key, ascending in
      guard let self = self else { return }
      let sortDescription = NSSortDescriptor(key: key, ascending: ascending)
      self.coreData.fetchedResultsController.fetchRequest.sortDescriptors = [sortDescription]
      do{
        try? self.coreData.fetchedResultsController.performFetch()
      }
      view?.reloadTable()
    }
  }
  
  func setSortDescriptor() {
    if userDefaultsService.defaults.bool(forKey: Keys.sortName){
      let sortDescription = NSSortDescriptor(key: "name", ascending: true)
      self.coreData.fetchedResultsController.fetchRequest.sortDescriptors = [sortDescription]
      do{
        try? self.coreData.fetchedResultsController.performFetch()
      }
    }
    if userDefaultsService.defaults.bool(forKey: Keys.sortNameBack){
      let sortDescription = NSSortDescriptor(key: "name", ascending: false)
      self.coreData.fetchedResultsController.fetchRequest.sortDescriptors = [sortDescription]
      do{
        try? self.coreData.fetchedResultsController.performFetch()
      }
    }
    if userDefaultsService.defaults.bool(forKey: Keys.sortSurname){
      let sortDescription = NSSortDescriptor(key: "surname", ascending: true)
      self.coreData.fetchedResultsController.fetchRequest.sortDescriptors = [sortDescription]
      do{
        try? self.coreData.fetchedResultsController.performFetch()
      }
    }
    if userDefaultsService.defaults.bool(forKey: Keys.sortSurnameBack){
      let sortDescription = NSSortDescriptor(key: "surname", ascending: false)
      self.coreData.fetchedResultsController.fetchRequest.sortDescriptors = [sortDescription]
      do{
        try? self.coreData.fetchedResultsController.performFetch()
      }
    }
  }
  
  func heightForHeaderInSection() -> CGFloat {
    60
  }
  
  func loadPersistentContainer() {
    coreData.appDelegate.persistentContainer.loadPersistentStores { description, error in
      if let error = error{
        print(error.localizedDescription)
      } else{
        do{
          try self.coreData.fetchedResultsController.performFetch()
        } catch{
          print(error)
        }
      }
    }
  }
  
  func buttonForCreateTapped() -> LoginViewController {
    let loginViewController = LoginViewController(
      labelForName: "Enter your Name",
      labelForSurname: "Enter your Surname",
      labelForCountry: "Enter your Country of residence",
      labelForDateOfBirth: "Enter your Date of Birth")
    loginViewController.textFieldForName.text = ""
    loginViewController.textFieldForSurname.text = ""
    loginViewController.textFieldForCountry.text = ""
    loginViewController.textFieldForDateOfBirth.text = ""
    
    return loginViewController
  }
  
  func buttonForSortTableViewTapped() {
    
  }
  
  func userDelete(indexPath: IndexPath) {
    coreData.userDelete(indexPath: indexPath, fetchedResultsController: coreData.fetchedResultsController)
  }
  
  func saveContext() {
    coreData.saveContext()
  }
  
  func returnContext() -> NSManagedObjectContext {
    coreData.returnContext()
  }
  
}

