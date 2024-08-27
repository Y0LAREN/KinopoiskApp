import Foundation
import UIKit
import SnapKit

final class SelectedFilmViewController: UIViewController {
  
  private var viewModel: SelectedFilmViewModelProtocol = SelectedFilmViewModel()
  
  private var imagePoster = UIImageView()
  
  private var scrollView = UIScrollView()
  
  private lazy var labelNameRu = UILabel()
  private lazy var labelNameEn = UILabel()
  private lazy var labelFilmInfo = UILabel()
  private lazy var labelFilmRatingKinopoisk = UILabel()
  private lazy var labelFilmRatingIMDB = UILabel()
  private lazy var labelReleaseDate = UILabel()
  private lazy var labelDurationFilm = UILabel()
  
  private var contentView = UIView()
  private var viewForRateAndInfo = UIView()
  
  private lazy var mainStackView = UIStackView()
  private lazy var nameStackView = UIStackView()
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    view.backgroundColor = .white
    setupImagePoster()
    setupScrollView()
    setupContentView()
    setupMainStackView()
    setupNameStackView()
    setupViewForRateAndInfo()
    setupLabelReleaseDate()
    setupLabelDurationFilm()
    setupLabelFilmRatingIMDB()
    setupLabelFilmRatingKinopoisk()
    setupLabelNameRu()
    setupLabelNameEn()
    setupLabelFilmInfo()
    viewModel.updateView
  }
  
  init(imagePoster: UIImage?,
       labelNameEn: String,
       labelNameRu: String,
       labelFilmInfo: String,
       labelReleaseDate: String,
       labelDurationFilm: String,
       labelFilmRatingIMDB: String,
       labelFilmRatingKinopoisk: String ) {
    super.init(nibName: nil, bundle: nil)
    self.imagePoster.image = imagePoster
    self.labelNameEn.text = labelNameEn
    self.labelNameRu.text = labelNameRu
    self.labelFilmInfo.text = labelFilmInfo
    self.labelReleaseDate.text = labelReleaseDate
    self.labelDurationFilm.text = labelDurationFilm
    self.labelFilmRatingIMDB.text = labelFilmRatingIMDB
    self.labelFilmRatingKinopoisk.text = labelFilmRatingKinopoisk
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Setup views
  
  private func setupScrollView(){
    view.addSubview(scrollView)
    scrollView.contentInset = UIEdgeInsets(top: 600, left: 0, bottom: 0, right: 0)
    scrollView.addSubview(contentView)
    scrollView.snp.makeConstraints { make in
      make.left.right.top.bottom.equalToSuperview()
    }
  }
  
  private func setupContentView(){
    contentView.addSubview(mainStackView)
    
    contentView.snp.makeConstraints { make in
      make.left.right.top.bottom.equalToSuperview()
    }
  }
  
  private func setupMainStackView(){
    mainStackView.backgroundColor = .white
    mainStackView.axis = .vertical
    mainStackView.layer.cornerRadius = 25
    mainStackView.spacing = 40
    mainStackView.alignment = .center
    mainStackView.addArrangedSubview(nameStackView)
    mainStackView.addArrangedSubview(viewForRateAndInfo)
    mainStackView.addArrangedSubview(labelFilmInfo)
    
    mainStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.width.equalTo(view.frame.width)
    }
  }
  
  private func setupNameStackView(){
    nameStackView.axis = .vertical
    nameStackView.alignment = .center
    nameStackView.addArrangedSubview(labelNameRu)
    nameStackView.addArrangedSubview(labelNameEn)
  }
  
  private func setupViewForRateAndInfo(){
    viewForRateAndInfo.backgroundColor = .white
    viewForRateAndInfo.addSubview(labelReleaseDate)
    viewForRateAndInfo.addSubview(labelDurationFilm)
    viewForRateAndInfo.addSubview(labelFilmRatingIMDB)
    viewForRateAndInfo.addSubview(labelFilmRatingKinopoisk)
    
  }
  
  private func setupImagePoster(){
    view.addSubview(imagePoster)
    imagePoster.contentMode = .scaleAspectFill
    imagePoster.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.right.equalToSuperview()
      make.centerX.equalToSuperview()
    }
  }
  
  private func setupLabelFilmRatingKinopoisk(){
    labelFilmRatingKinopoisk.textColor = UIColor(named: viewModel.textColorForLabels)
    labelFilmRatingKinopoisk.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.equalToSuperview().inset(30)
    }
  }
  
  private func setupLabelFilmRatingIMDB(){
    labelFilmRatingIMDB.textColor = UIColor(named: viewModel.textColorForLabels)
    labelFilmRatingIMDB.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview().inset(30)
    }
  }
  
  private func setupLabelReleaseDate(){
    labelReleaseDate.textColor = UIColor(named: viewModel.textColorForLabels)
    labelReleaseDate.snp.makeConstraints { make in
      make.top.equalTo(labelFilmRatingKinopoisk.snp.bottom).inset(40)
      make.left.equalToSuperview().inset(30)
    }
  }
  
  private func setupLabelDurationFilm(){
    labelDurationFilm.textColor = UIColor(named: viewModel.textColorForLabels)
    labelDurationFilm.snp.makeConstraints { make in
      make.top.equalTo(labelFilmRatingIMDB.snp.bottom).inset(40)
      make.right.equalToSuperview().inset(30)
    }
  }
  
  private func setupLabelNameRu(){
    labelNameRu.font = .systemFont(ofSize: viewModel.fontSizeForLabelNameRu)
  }
  
  private func setupLabelNameEn(){
    labelNameEn.font = .systemFont(ofSize: viewModel.fontSizeForLabelNameEn)
  }
  
  private func setupLabelFilmInfo(){
    labelFilmInfo.font = .systemFont(
      ofSize:viewModel.fontSizeForLabelFilmInfo)
    labelFilmInfo.numberOfLines = 0
  }
  
  //MARK: - Methods
  func urlToData(urlString: URL?){
    
    guard let url = urlString else{return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
      if let error = error {
        print(error.localizedDescription)
      }
        guard let data = data, let imageData = UIImage(data: data) else {return}
      DispatchQueue.main.async {
        self.imagePoster.image = imageData
      }
    })
    task.resume()
  }
}
