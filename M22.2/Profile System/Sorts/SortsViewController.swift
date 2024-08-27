import Foundation
import UIKit

// MARK: Class

final class SortsViewController: UIViewController{
  
  // MARK: Private properties
  private let presenter: SortsPresenterProtocol = SortsPresenter()
  
  private var stackViewMain = UIStackView()
  
  private var stackViewForName = UIStackView()
  private var stackViewForNameBack = UIStackView()
  private var stackViewForSurname = UIStackView()
  private var stackViewForSurnameBack = UIStackView()
  
  private var buttonForSortingByName = UIButton ()
  private lazy var labelForSortingByName: UILabel = {
    let labelForSortingByName = UILabel()
    labelForSortingByName.text = ConstantsForSortsViewController.titleForLableForSortingByName
    return labelForSortingByName
  }()
  
  private var buttonForSortingByNameBack = UIButton()
  private lazy var labelForSortingByNameBack: UILabel = {
    let labelForSortingByNameBack = UILabel()
    labelForSortingByNameBack.text = ConstantsForSortsViewController.titleForLableForSortingByNameBack
    return labelForSortingByNameBack
  }()
  
  private var buttonForSortingBySurname = UIButton()
  private lazy var labelForSortingBySurname: UILabel = {
    let labelForSortingBySurname = UILabel()
    labelForSortingBySurname.text = ConstantsForSortsViewController.titleForLableForSortingBySurname
    return labelForSortingBySurname
  }()
  
  private var buttonForSortingBySurnameBack = UIButton()
  private lazy var labelForSortingBySurnameBack: UILabel = {
    let labelForSortingBySurnameBack = UILabel()
    labelForSortingBySurnameBack.text = ConstantsForSortsViewController.titleForLableForSortingBySurnameBack
    return labelForSortingBySurnameBack
  }()
  
  // MARK: - ViewController func
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
    setupTargetsForButtons()
  }
  // MARK: - Setup views
  
  private func setupStackViewMain(){
    stackViewMain.axis = .vertical
    stackViewMain.distribution = .fillEqually
    stackViewMain.alignment = .fill
    stackViewMain.spacing = ConstantsForSortsViewController.spacingForMainStackView
    
    view.addSubview(stackViewMain)
    stackViewMain.addArrangedSubview(stackViewForName)
    stackViewMain.addArrangedSubview(stackViewForNameBack)
    stackViewMain.addArrangedSubview(stackViewForSurname)
    stackViewMain.addArrangedSubview(stackViewForSurnameBack)
    
    stackViewMain.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(80)
      make.left.equalToSuperview()
    }
  }
  
  private func setupStackViewForName(){
    stackViewForName.axis = .horizontal
    stackViewForName.distribution = .fillEqually
    stackViewForName.alignment = .fill
    stackViewForName.spacing = ConstantsForSortsViewController.spacingForStackViews
    stackViewForName.addArrangedSubview(buttonForSortingByName)
    stackViewForName.addArrangedSubview(labelForSortingByName)
  }
  
  private func setupStackViewForNameBack(){
    stackViewForNameBack.axis = .horizontal
    stackViewForNameBack.distribution = .fillEqually
    stackViewForNameBack.alignment = .fill
    stackViewForNameBack.spacing = ConstantsForSortsViewController.spacingForStackViews
    stackViewForNameBack.addArrangedSubview(buttonForSortingByNameBack)
    stackViewForNameBack.addArrangedSubview(labelForSortingByNameBack)
  }
  
  private func setupStackViewForSurname(){
    stackViewForSurname.axis = .horizontal
    stackViewForSurname.distribution = .fillEqually
    stackViewForSurname.alignment = .fill
    stackViewForSurname.spacing = ConstantsForSortsViewController.spacingForStackViews
    stackViewForSurname.addArrangedSubview(buttonForSortingBySurname)
    stackViewForSurname.addArrangedSubview(labelForSortingBySurname)
  }
  
  private func setupStackViewForSurnameBack(){
    
    stackViewForSurnameBack.axis = .horizontal
    stackViewForSurnameBack.distribution = .fillEqually
    stackViewForSurnameBack.alignment = .fill
    stackViewForSurnameBack.spacing = ConstantsForSortsViewController.spacingForStackViews
    stackViewForSurnameBack.addArrangedSubview(buttonForSortingBySurnameBack)
    stackViewForSurnameBack.addArrangedSubview(labelForSortingBySurnameBack)
  }
  
  // MARK: - Objective func
  
  @objc
  private func workButtonForSortingByName(){
    
    presenter.sortByNameButtonTapped()
    
    guard presenter.checkForName else{return}
    buttonForSortingByName.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForActiveButton), for: .normal)
    buttonForSortingByNameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurname.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurnameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    
    
  }
  
  @objc
  private func workButtonForSortingByNameBack(){
    
    presenter.sortByNameBackButtonTapped()
    
    guard presenter.checkForNameBack else{return}
    buttonForSortingByName.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingByNameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForActiveButton), for: .normal)
    buttonForSortingBySurname.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurnameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    
  }
  
  @objc
  private func workButtonForSortingBySurname(){
    
    presenter.sortBySurnameButtonTapped()
    
    guard presenter.checkForSurname else{return}
    buttonForSortingByName.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingByNameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurname.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForActiveButton), for: .normal)
    buttonForSortingBySurnameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    
  }
  
  @objc
  private func workButtonForSortingBySurnameBack(){
    
    presenter.sortBySurnameBackButtonTapped()
    
    guard presenter.checkForSurnameBack else{return}
    buttonForSortingByName.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingByNameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurname.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForNotActiveButton), for: .normal)
    buttonForSortingBySurnameBack.setImage(UIImage(systemName: ConstantsForSortsViewController.imageForActiveButton), for: .normal)
    
  }
  
  // MARK: - Other function
  
  private func setupViews(){
    
    
    setupStackViewMain()
    setupStackViewForName()
    setupStackViewForNameBack()
    setupStackViewForSurname()
    setupStackViewForSurnameBack()
    setupButtonsImage()
    
  }
  
  private func setupTargetsForButtons(){
    
    buttonForSortingByName.addTarget(self, action: #selector(workButtonForSortingByName), for: .touchUpInside)
    buttonForSortingByNameBack.addTarget(self, action: #selector(workButtonForSortingByNameBack), for: .touchUpInside)
    buttonForSortingBySurname.addTarget(self, action: #selector(workButtonForSortingBySurname), for: .touchUpInside)
    buttonForSortingBySurnameBack.addTarget(self, action: #selector(workButtonForSortingBySurnameBack), for: .touchUpInside)
    
  }
  
  private func setupButtonsImage(){
    
    presenter.setupButtonImages()
    
    if presenter.savedName == true{
      buttonForSortingByName.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    else if presenter.savedName == false{
      buttonForSortingByName.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
    
    if presenter.savedNameBack == true{
      buttonForSortingByNameBack.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    else if presenter.savedNameBack == false{
      buttonForSortingByNameBack.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
    
    if presenter.savedSurname == true{
      buttonForSortingBySurname.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    else if presenter.savedSurname == false{
      buttonForSortingBySurname.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
    
    if presenter.savedSurnameBack == true{
      buttonForSortingBySurnameBack.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    else if presenter.savedSurnameBack == false{
      buttonForSortingBySurnameBack.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
    }
  }
  
}

