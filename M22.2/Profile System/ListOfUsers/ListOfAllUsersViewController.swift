import Foundation
import UIKit
import CoreData

final class ListOfAllUsersViewController: UIViewController {
  
  lazy var tableViewForUsers = UITableView()
  
  private let presenter: ListOfAllUsersPresenterProtocol = ListOfAllUsersPresenter()
  
  private var coreData: CoreDataProtocol = CoreData()
  
  private lazy var buttonForCreate: UIButton = {
    let buttonForCreate = UIButton()
    buttonForCreate.setTitle("Create new User", for: .normal)
    buttonForCreate.titleLabel?.font = .boldSystemFont(ofSize: 15)
    buttonForCreate.backgroundColor = UIColor(named: "buttonColor")
    return buttonForCreate
  }()
  
  private lazy var buttonForSortTableView: UIButton = {
    let buttonForSortTableView = UIButton()
    buttonForSortTableView.setImage(UIImage(systemName: "list.triangle"), for: .normal)
    buttonForSortTableView.backgroundColor = .white
    return buttonForSortTableView
  }()
  
  // MARK: - Override methods and inits
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.setView(self)
    presenter.setFecthControllerDelegate(delegate: self)
    presenter.loadPersistentContainer()
    presenter.changeSortDescriptor()
    presenter.setSortDescriptor()
    
    view.backgroundColor = .white
    
    setupTableViewForUsers()
    setupButtonForCreate()
    setupButtonForSortTableView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    reloadTable()
    print("1")
  }
  
  // MARK: - Objective methods
  @objc
  private func workButtonForCreate(){
    navigationController?.pushViewController(presenter.buttonForCreateTapped(), animated: true)
  }
  
  @objc
  private func workButtonForSortTableView(){
    presenter.buttonForSortTableViewTapped()
    navigationController?.present(SortsViewController(), animated: true)
  }
  
  //  MARK: - Setup Constraints
  private func setupButtonForCreate(){
    view.addSubview(buttonForCreate)
    buttonForCreate.layer.cornerRadius = 15
    buttonForCreate.snp.makeConstraints { make in
      make.width.equalTo(250)
      make.height.equalTo(50)
      make.top.equalToSuperview().inset(100)
      make.centerX.equalToSuperview()
    }
    
    buttonForCreate.addTarget(self, action: #selector(workButtonForCreate), for: .touchUpInside)
  }
  
  private func setupTableViewForUsers(){
    view.addSubview(tableViewForUsers)
    tableViewForUsers.register(CellForUsers.self, forCellReuseIdentifier: CellForUsers.cellForUsersID)
    tableViewForUsers.dataSource = self
    tableViewForUsers.delegate = self
    tableViewForUsers.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(260)
      make.left.right.bottom.equalToSuperview()
    }
    
    
  }
  
  private func setupButtonForSortTableView(){
    view.addSubview(buttonForSortTableView)
    buttonForSortTableView.layer.cornerRadius = 8
    buttonForSortTableView.snp.makeConstraints { make in
      make.bottom.equalTo(tableViewForUsers.snp.top)
      make.left.equalToSuperview()
      make.width.height.equalTo(30)
    }
    buttonForSortTableView.addTarget(self, action: #selector(workButtonForSortTableView), for: .touchUpInside)
  }
  
}

// MARK: - Extensions
extension ListOfAllUsersViewController: UITableViewDelegate, UITableViewDataSource{
  func numberOfSections(in tableView: UITableView) -> Int {
    presenter.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.numberOfRowInSection(section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = (tableView.dequeueReusableCell(withIdentifier: CellForUsers.cellForUsersID) as? CellForUsers)
    else{fatalError()}
    cell.nameUserLabel.text = presenter.nameForRow(at: indexPath)
    cell.surnameUserLabel.text = presenter.surnameForRow(at: indexPath)
    cell.dateOfBirthUserLabel.text = presenter.dateOfBirthdayForRow(at: indexPath)
    cell.countryUserLabel.text = presenter.countryForRow(at: indexPath)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      presenter.userDelete(indexPath: indexPath)
      presenter.saveContext()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    presenter.heightForRowAt()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(presenter.didSelectUser(at: indexPath), animated: true)
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let viewForHeader = UIView()
    viewForHeader.backgroundColor = UIColor(named: "itfPlaceholderColor")
    
    let labelForHeader = UILabel()
    labelForHeader.text = "List of users"
    viewForHeader.addSubview(labelForHeader)
    labelForHeader.snp.makeConstraints { make in
      make.top.right.bottom.equalToSuperview()
      make.left.equalToSuperview().inset(10)
    }
    
    return viewForHeader
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    presenter.heightForHeaderInSection()
  }
}

extension ListOfAllUsersViewController: NSFetchedResultsControllerDelegate{
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
    tableViewForUsers.beginUpdates()
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
    tableViewForUsers.endUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<any NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    
    switch type{
      
    case .insert:
      if let indexPath = newIndexPath{
        tableViewForUsers.insertRows(at: [indexPath], with: .automatic)
      }
    case .delete:
      if let indexPath = indexPath {
        tableViewForUsers.deleteRows(at: [indexPath], with: .automatic)
      }
    case .move:
      if let indexPath = indexPath{
        tableViewForUsers.deleteRows(at: [indexPath], with: .automatic)
      }
      if let newIndexPath = newIndexPath{
        tableViewForUsers.insertRows(at: [newIndexPath], with: .automatic)
      }
    case .update:
      if let indexPath = indexPath {
        guard let cell = (tableViewForUsers.dequeueReusableCell(withIdentifier: CellForUsers.cellForUsersID) as? CellForUsers)
        else{fatalError()}
        let user = coreData.fetchedResultsController.object(at: indexPath)
        cell.nameUserLabel.text = user.name
        cell.surnameUserLabel.text = user.surname
        cell.dateOfBirthUserLabel.text = user.dateOfBirth
        cell.countryUserLabel.text = user.country
      }
    @unknown default:
      fatalError()
    }
  }
}

extension ListOfAllUsersViewController: ListOfAllUsersViewProtocol{
  
  func reloadTable() {
    tableViewForUsers.reloadData()
  }
  
}

