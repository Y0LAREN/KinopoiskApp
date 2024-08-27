import Foundation
import UIKit
import CoreData

final class LoginViewController: UIViewController {
  
  private var presenter: LoginPresenterProtocol = LoginPresenter()
  
  private var coreData: CoreDataProtocol = CoreData()
  
  lazy var labelForName: UILabel = {
    let labelForName = UILabel()
    labelForName.text = "Enter your Name"
    labelForName.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForLabel)
    labelForName.textColor = .black
    return labelForName
  }()
  
  lazy var labelForSurname: UILabel = {
    let labelForSurname = UILabel()
    labelForSurname.text = "Enter your Surname"
    labelForSurname.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForLabel)
    labelForSurname.textColor = .black
    return labelForSurname
  }()
  
  lazy var labelForDateOfBirth: UILabel = {
    let labelForDateOfBirth = UILabel()
    labelForDateOfBirth.text = "Enter your Date of Birth"
    labelForDateOfBirth.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForLabel)
    labelForDateOfBirth.textColor = .black
    return labelForDateOfBirth
  }()
  
  lazy var labelForCountry: UILabel = {
    let labelForCountry = UILabel()
    labelForCountry.text = "Enter your Country of residence"
    labelForCountry.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForLabel)
    labelForCountry.textColor = .black
    return labelForCountry
  }()
  
  lazy var textFieldForName: UITextField = {
    let textFieldForName = UITextField()
    textFieldForName.layer.cornerRadius = ConstantsForLoginViewController.cornerRadiusForTextField
    textFieldForName.attributedPlaceholder = NSAttributedString(
      string: "Ivan",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: ConstantsForLoginViewController.colorNameForTextFielPlaceHolder) ?? UIColor.gray]
    )
    textFieldForName.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForTextField)
    textFieldForName.backgroundColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldBackground)
    textFieldForName.textColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldText)
    return textFieldForName
  }()
  
  lazy var textFieldForSurname: UITextField = {
    let textFieldForSurname = UITextField()
    textFieldForSurname.layer.cornerRadius = ConstantsForLoginViewController.cornerRadiusForTextField
    textFieldForSurname.attributedPlaceholder = NSAttributedString(
      string: "Ivanov",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: ConstantsForLoginViewController.colorNameForTextFielPlaceHolder) ?? UIColor.gray]
    )
    textFieldForSurname.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForTextField)
    textFieldForSurname.backgroundColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldBackground)
    textFieldForSurname.textColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldText)
    return textFieldForSurname
  }()
  
  lazy var textFieldForDateOfBirth: UITextField = {
    let textFieldForDateOfBirth = UITextField()
    textFieldForDateOfBirth.layer.cornerRadius = ConstantsForLoginViewController.cornerRadiusForTextField
    textFieldForDateOfBirth.attributedPlaceholder = NSAttributedString(
      string: "01.01.2001",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: ConstantsForLoginViewController.colorNameForTextFielPlaceHolder) ?? UIColor.gray]
    )
    textFieldForDateOfBirth.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForTextField)
    textFieldForDateOfBirth.backgroundColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldBackground)
    textFieldForDateOfBirth.textColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldText)
    return textFieldForDateOfBirth
  }()
  
  lazy var textFieldForCountry: UITextField = {
    let textFieldForCountry = UITextField()
    textFieldForCountry.layer.cornerRadius = ConstantsForLoginViewController.cornerRadiusForTextField
    textFieldForCountry.attributedPlaceholder = NSAttributedString(
      string: "Canada",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: ConstantsForLoginViewController.colorNameForTextFielPlaceHolder) ?? UIColor.gray]
    )
    textFieldForCountry.font = .systemFont(ofSize: ConstantsForLoginViewController.fontSizeForTextField)
    textFieldForCountry.backgroundColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldBackground)
    textFieldForCountry.textColor = UIColor(named: ConstantsForLoginViewController.colorNameForTextFieldText)
    return textFieldForCountry
  }()
  
  //MARK: - Private properties
  
  private lazy var buttonForSave: UIButton = {
    let buttonForSave = UIButton()
    buttonForSave.layer.cornerRadius = ConstantsForLoginViewController.cornerRadiusForButton
    buttonForSave.setTitle("Save User", for: .normal)
    buttonForSave.titleLabel?.font = .boldSystemFont(ofSize: ConstantsForLoginViewController.fontSizeForSaveButton)
    buttonForSave.backgroundColor = UIColor(named: ConstantsForLoginViewController.colorNameBackgroundColorForSaveButton)
    return buttonForSave
  }()
  
  private lazy var mainStackView: UIStackView = {
    let mainStackView = UIStackView()
    mainStackView.distribution = .fillProportionally
    mainStackView.alignment = .fill
    mainStackView.axis = .vertical
    mainStackView.spacing =  ConstantsForLoginViewController.spacingForMainStackView
    return mainStackView
  }()
  
  private lazy var stackViewForName: UIStackView = {
    let stackViewForName = UIStackView()
    stackViewForName.distribution = .fillEqually
    stackViewForName.alignment = .fill
    stackViewForName.axis = .vertical
    return stackViewForName
  }()
  
  private lazy var stackViewForSurname: UIStackView = {
    let stackViewForSurname = UIStackView()
    stackViewForSurname.distribution = .fillEqually
    stackViewForSurname.alignment = .fill
    stackViewForSurname.axis = .vertical
    return stackViewForSurname
  }()
  
  private lazy var stackViewForDateOfBirth: UIStackView = {
    let stackViewForDateOfBirth = UIStackView()
    stackViewForDateOfBirth.distribution = .fillEqually
    stackViewForDateOfBirth.alignment = .fill
    stackViewForDateOfBirth.axis = .vertical
    return stackViewForDateOfBirth
  }()
  
  private lazy var stackViewForCountry: UIStackView = {
    let stackViewForCountry = UIStackView()
    stackViewForCountry.distribution = .fillEqually
    stackViewForCountry.alignment = .fill
    stackViewForCountry.axis = .vertical
    return stackViewForCountry
  }()
  
  //MARK: - Override and init
  override func viewDidLoad(){
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViewsAndTargets()
  }
  
  init(labelForName: String,
       labelForSurname: String,
       labelForCountry: String,
       labelForDateOfBirth: String){
      super.init(nibName: nil, bundle: nil)
    
    self.labelForName.text = labelForName
    self.labelForSurname.text = labelForSurname
    self.labelForCountry.text = labelForCountry
    self.labelForDateOfBirth.text = labelForDateOfBirth
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Setup views methods
  private func setupMainStackView(){
    view.addSubview(mainStackView)
    mainStackView.addArrangedSubview(stackViewForName)
    mainStackView.addArrangedSubview(stackViewForSurname)
    mainStackView.addArrangedSubview(stackViewForDateOfBirth)
    mainStackView.addArrangedSubview(stackViewForCountry)
    
    mainStackView.snp.makeConstraints { make in
      make.left.right.equalToSuperview().inset(20)
      make.top.equalTo(buttonForSave.snp.bottom).offset(30)
    }
  }
  
  private func setupStackViewForName(){
    stackViewForName.addArrangedSubview(labelForName)
    stackViewForName.addArrangedSubview(textFieldForName)
    stackViewForName.snp.makeConstraints { make in
      make.height.equalTo(130)
    }
  }
  
  private func setupStackViewForSurname(){
    stackViewForSurname.addArrangedSubview(labelForSurname)
    stackViewForSurname.addArrangedSubview(textFieldForSurname)
    stackViewForSurname.snp.makeConstraints { make in
      make.height.equalTo(130)
    }
  }
  
  private func setupStackViewForDateOfBirth(){
    stackViewForDateOfBirth.addArrangedSubview(labelForDateOfBirth)
    stackViewForDateOfBirth.addArrangedSubview(textFieldForDateOfBirth)
    stackViewForDateOfBirth.snp.makeConstraints { make in
      make.height.equalTo(130)
    }
  }
  
  private func setupStackViewForCountry(){
    stackViewForCountry.addArrangedSubview(labelForCountry)
    stackViewForCountry.addArrangedSubview(textFieldForCountry)
    stackViewForCountry.snp.makeConstraints { make in
      make.height.equalTo(130)
    }
  }
  
  private func setupButtonForSave(){
    view.addSubview(buttonForSave)
    buttonForSave.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(100)
      make.centerX.equalToSuperview()
      make.height.equalTo(50)
      make.width.equalTo(250)
    }
  }
  //MARK: - Objective methods
  
  @objc
  func workButtonForSave(){
    setupTextForLabels()
    presenter.model.name = textFieldForName.text ?? ""
    presenter.model.surname = textFieldForSurname.text ?? ""
    presenter.model.country = textFieldForCountry.text ?? ""
    presenter.model.dateOfBirth = textFieldForDateOfBirth.text ?? ""
    
    presenter.buttonForSaveTapped()
  }
  
  // MARK: - Other methods
  private func setupTextForLabels(){
    labelForName.text = "Name: \(textFieldForName.text ?? "")"
    labelForSurname.text = "Surname: \(textFieldForSurname.text ?? "")"
    labelForDateOfBirth.text = "Date of Birth: \(textFieldForDateOfBirth.text ?? "")"
    labelForCountry.text = "Country of residence: \(textFieldForCountry.text ?? "")"
  }
  
  private func setupViewsAndTargets(){
    coreData.returnContext()
    setupButtonForSave()
    setupMainStackView()
    setupStackViewForName()
    setupStackViewForSurname()
    setupStackViewForDateOfBirth()
    setupStackViewForCountry()
    buttonForSave.addTarget(self, action: #selector(workButtonForSave), for: .touchUpInside)
  }
}
