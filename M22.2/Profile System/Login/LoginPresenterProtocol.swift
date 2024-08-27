import Foundation

protocol LoginPresenterProtocol {
  
  func buttonForSaveTapped()
  
  var model: LoginModel { get set }
  
  var coreData: CoreDataProtocol { get set}
  
}
