import Foundation

protocol SearchFilmsViewModelProtocol {
  
  var IsSearchButtonActive: Bool { get set }
  
  var IsPopularButtonActive: Bool { get set }
  
  var userInput: String { get set }
  
  var textFromInputTextField: String { get set }
  
  var titleForResultLabel: String { get set }
  
  var numberOfSection: Int { get }
  
  var numberOfRowInSection: (_ section: Int) -> Int { get }
  
  var titleForRow: ((_ index: IndexPath) -> String) { get }
  
  var imageForRow: ((_ indexPath: IndexPath) -> URL) { get }
  
  var updateView: (() -> Void)? { get set }
  
  func searchButtonTapped()
  
  func popularFilmsButtonTapped()
  
  func cellTaped(_ indexPath: IndexPath)  -> SelectedFilmViewController
  
  func updateCellModelFilmsGeneral(data: [FilmsGeneral])
  
  func updateCellModelItemGeneral(data: [ItemGeneral])
  
  func updateVCFilmInfoModelFilmsGeneral(data: [FilmsGeneral])
  
  func updateVCFilmInfoModelItemGeneral(data: [ItemGeneral])
}

