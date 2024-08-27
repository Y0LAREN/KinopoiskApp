import Foundation

final class SearchFilmsViewModel: SearchFilmsViewModelProtocol{
  
  var userInput: String = ""
  
  var IsSearchButtonActive: Bool = false
  
  var IsPopularButtonActive: Bool = false
  
  var textFromInputTextField = ""
  var titleForResultLabel = ""
  
  var numberOfSection: Int { return 1 }
  
  lazy var numberOfRowInSection: (Int) -> Int = getNumberOfRowInSection
  
  lazy var titleForRow: ((IndexPath) -> String) = getTitleForRow
  
  lazy var imageForRow: ((IndexPath) -> URL) = getImageForRow
  
  var updateView: (() -> Void)?
  
  private var cellModel: [CellModel] = []
  
  var selectedFilmModel: [SelectedFilmModel] = []
  
  private var networkService: NetworkServiceProtocol = NetworkService()
  
  func searchButtonTapped() {
    fetchAndUpdateForSearch()
  }
  
  func popularFilmsButtonTapped() {
    fetchAndUpdateForPopularFilms()
  }
  
  func cellTaped(_ indexPath: IndexPath)  -> SelectedFilmViewController {
    goToNextView(indexPath)
  }
  
  func updateCellModelFilmsGeneral(data: [FilmsGeneral]) {
    self.cellModel = data.map {
      guard let urlString = $0.posterUrlPreview,
            let url = URL(string: urlString) else {return CellModel(label: "", urlToUIImage: URL(string: "")!)}
      return CellModel(label: $0.nameRu ?? "", urlToUIImage: url)
    }
    print("1 \(cellModel)")
    updateView?()
  }
  
  func updateCellModelItemGeneral(data: [ItemGeneral]) {
    self.cellModel = data.map {
      guard let urlString = $0.posterUrlPreview,
            let url = URL(string: urlString) else {return CellModel(label: "", urlToUIImage: URL(string: "")!)}
      return CellModel(label: $0.nameRu ?? "", urlToUIImage: url)
    }
    updateView?()
  }
  
  func updateVCFilmInfoModelFilmsGeneral(data: [FilmsGeneral]) {
    self.selectedFilmModel = data.map {
      guard let urlString = $0.posterUrlPreview,
            let url = URL(string: urlString) else {return SelectedFilmModel(
              poster: URL(string: "")!,
              nameEn: "",
              nameRu: "",
              filmInfo: "",
              releaseDate: "",
              durationFilm: "",
              filmRatingIMDB: "",
              filmRatingKinopoisk: "")}
      return SelectedFilmModel(
        poster: url,
        nameEn: $0.nameEn ?? "",
        nameRu: $0.nameRu ?? "",
        filmInfo: $0.description  ?? "",
        releaseDate: $0.year ?? "",
        durationFilm: $0.filmLength ?? "",
        filmRatingIMDB: "---",
        filmRatingKinopoisk: $0.rating ?? "")
    }
    updateView?()
  }
  
  func updateVCFilmInfoModelItemGeneral(data: [ItemGeneral]) {
    self.selectedFilmModel = data.map {
      guard let urlString = $0.posterUrlPreview,
            let ratingKinopoisk = $0.ratingKinopoisk,
            let ratingImbd = $0.ratingImdb,
            let year = $0.year,
            let url = URL(string: urlString) else {return SelectedFilmModel(
              poster: URL(string: "")!,
              nameEn: "",
              nameRu: "",
              filmInfo: "",
              releaseDate: "",
              durationFilm: "",
              filmRatingIMDB: "",
              filmRatingKinopoisk: "")}
      return SelectedFilmModel(
        poster: url,
        nameEn: $0.nameOriginal ?? "",
        nameRu: $0.nameRu ?? "",
        filmInfo: $0.description  ?? "",
        releaseDate: String(year),
        durationFilm: "---",
        filmRatingIMDB: String(ratingImbd),
        filmRatingKinopoisk: String(ratingKinopoisk))
    }
    updateView?()
  }
  
  private func fetchAndUpdateForSearch(){
    userInput = textFromInputTextField
    titleForResultLabel = "Search by request: " + userInput
    print("user input \(userInput)")
    networkService.fetchingData(
      urlNetwork:networkService.createdURL(
        urlString: ConstantsRequest.urlToSearchByNameTypeString,
        userInput: userInput)) { [weak self] viewModel in
          
      self?.updateCellModelFilmsGeneral(data: viewModel.films ?? [])
      self?.updateVCFilmInfoModelFilmsGeneral(data: viewModel.films ?? [])
          print("2 \(self?.cellModel)")
    }
  }
  
  private func fetchAndUpdateForPopularFilms(){
    titleForResultLabel = "Popular films"
    networkService.fetchingData(
      urlNetwork: networkService.createdURL(
        urlString: ConstantsRequest.urlToOutputOfPopularFilmsTypeString, userInput: ConstantsRequest.type)) { [weak self] viewModel in
          
      self?.updateCellModelItemGeneral(data: viewModel.items ?? [])
      self?.updateVCFilmInfoModelItemGeneral(data: viewModel.items ?? [])
          
    }
  }
  
  private func getNumberOfRowInSection(_ section: Int) -> Int{
    return cellModel.count
  }
  
  private func getTitleForRow(at indexPath: IndexPath) -> String {
    let film = cellModel[indexPath.row]
    return film.label
  }
  
  private func getImageForRow(at indexPath: IndexPath) -> URL{
    let film = cellModel[indexPath.row]
    return film.urlToUIImage
  }
  
  private func goToNextView(_ index: IndexPath) -> SelectedFilmViewController{
    let film = selectedFilmModel[index.row]
    
    let vc = SelectedFilmViewController(
      imagePoster: nil,
      labelNameEn: film.nameEn,
      labelNameRu: film.nameRu,
      labelFilmInfo: film.filmInfo,
      labelReleaseDate: film.releaseDate,
      labelDurationFilm: film.durationFilm,
      labelFilmRatingIMDB: film.filmRatingIMDB,
      labelFilmRatingKinopoisk: film.filmRatingKinopoisk)
    vc.urlToData(urlString: film.poster)
    
    return vc
    
  }
  
  
}
