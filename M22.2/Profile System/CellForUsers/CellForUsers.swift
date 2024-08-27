import UIKit
import SnapKit

class CellForUsers: UITableViewCell {
  
  static let cellForUsersID = "cellIdForUsersID"
  
  lazy var nameUserLabel: UILabel = {
    let nameFilmLabel = UILabel()
    nameFilmLabel.textColor = .black
    nameFilmLabel.font = .boldSystemFont(ofSize: 20)
    nameFilmLabel.numberOfLines = 0
    return nameFilmLabel
  }()
  
  lazy var surnameUserLabel: UILabel = {
    let surnameFilmLabel = UILabel()
    surnameFilmLabel.textColor = .black
    surnameFilmLabel.font = .boldSystemFont(ofSize: 20)
    surnameFilmLabel.numberOfLines = 0
    return surnameFilmLabel
  }()
  
  lazy var dateOfBirthUserLabel: UILabel = {
    let dateOfBirthUserLabel = UILabel()
    dateOfBirthUserLabel.textColor = .black
    dateOfBirthUserLabel.font = .systemFont(ofSize: 16)
    dateOfBirthUserLabel.numberOfLines = 0
    return dateOfBirthUserLabel
  }()
  
  lazy var countryUserLabel: UILabel = {
    let countryUserLabel = UILabel()
    countryUserLabel.textColor = .black
    countryUserLabel.font = .systemFont(ofSize: 16)
    countryUserLabel.numberOfLines = 0
    return countryUserLabel
  }()
  
  private lazy var stackViewMain: UIStackView = {
    let stackViewMain = UIStackView()
    stackViewMain.axis = .vertical
    stackViewMain.spacing = 0
    stackViewMain.alignment = .fill
    stackViewMain.distribution = .fillEqually
    return stackViewMain
  }()
  
  private lazy var stackViewNameAndSurname: UIStackView = {
    let stackViewNameAndSurname = UIStackView()
    stackViewNameAndSurname.axis = .horizontal
    stackViewNameAndSurname.spacing = 5
    stackViewNameAndSurname.alignment = .fill
    stackViewNameAndSurname.distribution = .fillEqually
    return stackViewNameAndSurname
  }()
  
  private lazy var stackViewDateAndCountry: UIStackView = {
    let stackViewDateAndCountry = UIStackView()
    stackViewDateAndCountry.axis = .horizontal
    stackViewDateAndCountry.spacing = 10
    stackViewDateAndCountry.alignment = .fill
    stackViewDateAndCountry.distribution = .fillEqually
    return stackViewDateAndCountry
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupStackViewMain()
    setupStackViewNameAndSurname()
    setupStackViewDateAndCountry()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupStackViewMain(){
    contentView.addSubview(stackViewMain)
    stackViewMain.addArrangedSubview(stackViewNameAndSurname)
    stackViewMain.addArrangedSubview(stackViewDateAndCountry)
    
    stackViewMain.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview()
      make.left.right.equalToSuperview().inset(10)
    }
  }
  
  private func setupStackViewNameAndSurname(){
    stackViewNameAndSurname.addArrangedSubview(nameUserLabel)
    stackViewNameAndSurname.addArrangedSubview(surnameUserLabel)
  }
  
  private func setupStackViewDateAndCountry(){
    stackViewDateAndCountry.addArrangedSubview(dateOfBirthUserLabel)
    stackViewDateAndCountry.addArrangedSubview(countryUserLabel)
  }
}


