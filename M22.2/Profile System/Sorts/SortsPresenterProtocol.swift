import Foundation

protocol SortsPresenterProtocol{
  
  var completion: ((String,Bool)->())? { get set }
  
  var checkForName: Bool { get set }
  var checkForNameBack: Bool { get set }
  var checkForSurname: Bool { get set }
  var checkForSurnameBack: Bool { get set }
  
  var savedName: Bool? { get set }
  var savedNameBack: Bool? { get set }
  var savedSurname: Bool? { get set }
  var savedSurnameBack: Bool? { get set }
  
  func sortByNameButtonTapped()
  
  func sortByNameBackButtonTapped()
  
  func sortBySurnameButtonTapped()
  
  func sortBySurnameBackButtonTapped()
  
  func setupButtonImages()
  
}

