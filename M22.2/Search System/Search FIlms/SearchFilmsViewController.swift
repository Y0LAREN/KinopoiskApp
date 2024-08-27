import Foundation
import UIKit

final class SearchFilmsViewController: UIViewController {
  
  private lazy var tableView = UITableView()
  private lazy var searchButton: UIButton = {
    let searchButton = UIButton()
    searchButton.setTitle(ConstantsForSearchViewController.titleForSearchButton,
                          for: .normal)
    searchButton.titleLabel?.font = .boldSystemFont(ofSize: ConstantsForSearchViewController.fontSizeForTextInButton)
    searchButton.layer.cornerRadius = 15
    searchButton.backgroundColor = UIColor(named: ConstantsForSearchViewController.backgroundButtonColor)
    
    return searchButton
  }()
  private lazy var popularFilmsButton: UIButton = {
    let popularFilmsButton = UIButton()
    popularFilmsButton.setTitle(ConstantsForSearchViewController.titleForPopularFilmsButton,
                                for: .normal)
    popularFilmsButton.titleLabel?.font = .boldSystemFont(ofSize: ConstantsForSearchViewController.fontSizeForTextInButton)
    popularFilmsButton.layer.cornerRadius = 15
    popularFilmsButton.backgroundColor = UIColor(named: ConstantsForSearchViewController.backgroundButtonColor)
    
    return popularFilmsButton
  }()
  lazy var inputTextField: UITextField = {
    let inputTextField = UITextField()
    inputTextField.attributedPlaceholder = NSAttributedString(
      string: ConstantsForSearchViewController.inputTextFieldPlaceholderText,
      attributes:
        [NSAttributedString.Key.foregroundColor:
          UIColor(named: ConstantsForSearchViewController.backgroundColorInputTextFiledPlaceholder) ??
         UIColor.gray])
    inputTextField.font = .systemFont(ofSize: ConstantsForSearchViewController.fontSizeForInputTextField)
    inputTextField.backgroundColor = UIColor(named: ConstantsForSearchViewController.backgroundColorInputTextFiled)
    inputTextField.textColor = UIColor(named: ConstantsForSearchViewController.textColorInputTextFiled)
    
    return inputTextField
  }()
  private lazy var resultLabel: UILabel = {
    let resultLabel = UILabel()
    resultLabel.font = .boldSystemFont(ofSize: ConstantsForSearchViewController.fontSizeForResultLabel)
    
    return resultLabel
  }()
  private var viewModel: SearchFilmsViewModelProtocol = SearchFilmsViewModel()
  
  private let cellForFilmsID = "cellIdForFilmsID"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupTableView()
    setupSearchButton()
    setupPopularFilmsButton()
    setupResultLabel()
    setupInputTextField()
    
    viewModel.updateView = { [weak self] in
      self?.tableView.reloadData()
    }
  }
  
  @objc
  private func workSearchButton(){
    viewModel.textFromInputTextField = inputTextField.text ?? ""
    viewModel.searchButtonTapped()
  }
  
  @objc
  private func workPopularFilmsButton(){
    viewModel.popularFilmsButtonTapped()
  }
  
  private func setupSearchButton(){
    view.addSubview(searchButton)
    viewModel.IsSearchButtonActive = true
    viewModel.IsPopularButtonActive = false
    
    searchButton.snp.makeConstraints { make in
      make.width.equalTo(150)
      make.height.equalTo(50)
      make.top.equalToSuperview().inset(180)
      make.centerX.equalToSuperview()
    }
    searchButton.addTarget(self, action: #selector(workSearchButton),
                           for: .touchUpInside)
  }
  
  private func setupPopularFilmsButton(){
    view.addSubview(popularFilmsButton)
    viewModel.IsSearchButtonActive = false
    viewModel.IsPopularButtonActive = true
    popularFilmsButton.snp.makeConstraints { make in
      make.width.equalTo(150)
      make.height.equalTo(50)
      make.top.equalToSuperview().inset(250)
      make.centerX.equalToSuperview()
    }
    popularFilmsButton.addTarget(self, action: #selector(workPopularFilmsButton),
                                 for: .touchUpInside)
  }
  
  private func setupTableView(){
    view.addSubview(tableView)
    
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(CellForFilms.self, forCellReuseIdentifier: cellForFilmsID)
    
    tableView.snp.makeConstraints { make in
      make.height.equalTo(500)
      make.right.left.bottom.equalToSuperview()
    }
  }
  
  private func setupInputTextField(){
    view.addSubview(inputTextField)
    
    inputTextField.layer.cornerRadius = 8
    inputTextField.snp.makeConstraints { make in
      make.height.equalTo(60)
      make.top.equalToSuperview().inset(80)
      make.left.right.equalToSuperview().inset(15)
    }
    
    inputTextField.text = viewModel.textFromInputTextField
  }
  
  private func setupResultLabel(){
    view.addSubview(resultLabel)
    resultLabel.snp.makeConstraints { make in
      make.height.equalTo(60)
      make.left.equalToSuperview().inset(20)
      make.bottom.equalTo(tableView.snp.top).inset(10)
    }
  }
  
}

extension SearchFilmsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowInSection(section)
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSection
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = (tableView.dequeueReusableCell(withIdentifier: cellForFilmsID) as? CellForFilms)
    else{ fatalError() }
    
    cell.nameFilmLabel.text = viewModel.titleForRow(indexPath)
    cell.urlToData(urlString: viewModel.imageForRow(indexPath), poster: cell.posterFilmImageView)
    
    return cell
  }
  
}

extension SearchFilmsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(viewModel.cellTaped(indexPath), animated: true)
  }
}
  

