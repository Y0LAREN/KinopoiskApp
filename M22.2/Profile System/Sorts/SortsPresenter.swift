import Foundation
import UIKit

final class SortsPresenter: SortsPresenterProtocol {
  
  var savedName: Bool?
  var savedNameBack: Bool?
  var savedSurname: Bool?
  var savedSurnameBack: Bool?
  
  var userDefaultsService: UserDefaultsServiceProtocol = UserDefaultsService()
  
  var checkForName = false
  var checkForNameBack = false
  var checkForSurname = false
  var checkForSurnameBack = false
  
  var completion: ((String, Bool) -> ())?
  
  func sortByNameButtonTapped() {
    setValueForUserDefaults(
      valueForName: true,
      valueForNameBack: false,
      valueForSurname: false,
      valueForSurnameBack: false)
    
    guard userDefaultsService.defaults.bool(forKey: Keys.sortName)
    else { return }
    checkForName = userDefaultsService.defaults.bool(forKey: Keys.sortName)
    
    completion?("name", true)
  }
  
  func sortByNameBackButtonTapped() {
    setValueForUserDefaults(
      valueForName: false,
      valueForNameBack: true,
      valueForSurname: false,
      valueForSurnameBack: false)
    
    guard userDefaultsService.defaults.bool(forKey: Keys.sortNameBack)
    else { return }
    checkForNameBack = userDefaultsService.defaults.bool(forKey: Keys.sortNameBack)
    
    completion?("name", false)
  }
  
  func sortBySurnameButtonTapped() {
    setValueForUserDefaults(
    valueForName: false,
    valueForNameBack: false,
    valueForSurname: true,
    valueForSurnameBack: false)
    
    guard userDefaultsService.defaults.bool(forKey: Keys.sortSurname)
    else { return }
    checkForSurname = userDefaultsService.defaults.bool(forKey: Keys.sortSurname)
    
    completion?("surname", true)
  }
  
  func sortBySurnameBackButtonTapped() {
    setValueForUserDefaults(
      valueForName: false,
      valueForNameBack: false,
      valueForSurname: false,
      valueForSurnameBack: true)
    
    guard userDefaultsService.defaults.bool(forKey: Keys.sortSurnameBack)
    else { return }
    checkForSurnameBack = userDefaultsService.defaults.bool(forKey: Keys.sortSurnameBack)
    
    completion?("surname", false)
  }
  
  func setupButtonImages() {
    setValuesForSavedSorts()
  }
  
  func setValueForUserDefaults(
    valueForName: Bool,
    valueForNameBack: Bool,
    valueForSurname: Bool,
    valueForSurnameBack: Bool){
      
      userDefaultsService.defaults.set(valueForName,
                   forKey: Keys.sortName)
      userDefaultsService.defaults.set(valueForNameBack,
                   forKey: Keys.sortNameBack)
      userDefaultsService.defaults.set(valueForSurname,
                   forKey: Keys.sortSurname)
      userDefaultsService.defaults.set(valueForSurnameBack,
                   forKey: Keys.sortSurnameBack)
      
  }
  
  func setValuesForSavedSorts(){
    
    savedName = userDefaultsService.defaults.bool(
      forKey: Keys.sortName)
    savedNameBack = userDefaultsService.defaults.bool(
      forKey: Keys.sortNameBack)
    savedSurname = userDefaultsService.defaults.bool(
      forKey: Keys.sortSurname)
    savedSurnameBack = userDefaultsService.defaults.bool(
      forKey: Keys.sortSurnameBack)
    
  }
  
}
