import Foundation

final class SelectedFilmViewModel: SelectedFilmViewModelProtocol {
  
  var updateView: (() -> Void)?
  
  var fontSizeForLabelNameRu: CGFloat {
    return 26
  }
  
  var fontSizeForLabelNameEn: CGFloat {
    return 16
  }
  
  var textColorForLabels: String {
    return "itfPlaceholderColor"
  }
  
  var fontSizeForLabelFilmInfo: CGFloat {
    return 14
  }
  
  
  
}

