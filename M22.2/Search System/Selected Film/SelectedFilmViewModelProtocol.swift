import Foundation

protocol SelectedFilmViewModelProtocol {
  
  var fontSizeForLabelNameRu: CGFloat { get }
  
  var fontSizeForLabelNameEn: CGFloat { get }
  
  var textColorForLabels: String { get }
  
  var fontSizeForLabelFilmInfo: CGFloat { get }
  
  var updateView: (() -> Void)? { get set }
}

