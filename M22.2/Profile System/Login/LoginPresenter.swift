import Foundation

final class LoginPresenter: LoginPresenterProtocol {
  
  var model: LoginModel = LoginModel(name: "", surname: "", country: "", dateOfBirth: "")
  
  var coreData: CoreDataProtocol = CoreData()
  
  func buttonForSaveTapped() {
    saveUser()
  }
  
  private func saveUser(){
    
    coreData.createUser(
      name: model.name,
      surname: model.surname, 
      dateOfBirth: model.dateOfBirth,
      country: model.country)
    
  }

  
}

