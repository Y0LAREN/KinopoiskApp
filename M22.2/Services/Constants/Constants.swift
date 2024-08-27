//
//  Constants.swift
//  M22.2
//
//  Created by Илья Иванов on 15.08.2024.
//

import Foundation

// MARK: - Search ViewController
enum ConstantsForSearchViewController{
  static let titleForSearchButton = "Search"
  static let titleForPopularFilmsButton = "Popular Films"
  static let backgroundButtonColor = "buttonColor"
  static let inputTextFieldPlaceholderText = "Enter the name of the movie"
  static let backgroundColorInputTextFiledPlaceholder = "itfPlaceholderColor"
  static let backgroundColorInputTextFiled = "itfBackgroundColor"
  static let textColorInputTextFiled = "itfTextColor"
  
  static let fontSizeForTextInButton: CGFloat = 15
  static let fontSizeForInputTextField: CGFloat = 14
  static let fontSizeForResultLabel: CGFloat = 17
}

// MARK: - Sorts ViewController
enum ConstantsForSortsViewController{
  static let imageForActiveButton = "checkmark.square.fill"
  static let imageForNotActiveButton = "checkmark.square"
  static let spacingForMainStackView: CGFloat = 30
  static let spacingForStackViews: CGFloat = 10
  static let titleForLableForSortingByName = "By Name"
  static let titleForLableForSortingByNameBack = "By Name back"
  static let titleForLableForSortingBySurname = "By Surname"
  static let titleForLableForSortingBySurnameBack = "By Surname back"
}

// MARK: - Login ViewController
enum ConstantsForLoginViewController{

  static let spacingForMainStackView: CGFloat = 30
  static let fontSizeForSaveButton: CGFloat = 15
  static let fontSizeForLabel: CGFloat = 20
  static let fontSizeForTextField: CGFloat = 16
  static let cornerRadiusForTextField: CGFloat = 10
  static let cornerRadiusForButton: CGFloat = 15
  static let colorNameForTextFielPlaceHolder = "itfPlaceholderColor"
  static let colorNameForTextFieldBackground = "backITFColor"
  static let colorNameForTextFieldText = "itfTextColor"
  static let colorNameBackgroundColorForSaveButton = "buttonColor"
  
}

// MARK: - Network
enum ConstantsRequest{
  
  static let type = "TOP_250_MOVIES"
  
  static let urlToSearchByNameTypeString = "https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword="
  
  static let urlToOutputOfPopularFilmsTypeString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type="
  
}
