import UIKit
import SnapKit

final class CellForFilms: UITableViewCell {
  
  lazy var posterFilmImageView: UIImageView = {
    let poster = UIImageView()
    poster.contentMode = .scaleAspectFit
    return poster
  }()
  
  lazy var nameFilmLabel: UILabel = {
    let name = UILabel()
    name.textColor = .black
    name.font = .systemFont(ofSize: 16)
    name.numberOfLines = 0
    return name
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupNameFilmLabel()
    setupPosterFilmImageView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupPosterFilmImageView(){
    contentView.addSubview(posterFilmImageView)
    posterFilmImageView.snp.makeConstraints { make in
      make.left.equalToSuperview().inset(10)
      make.bottom.top.equalToSuperview().inset(10)
      make.width.equalTo(40)
    }
  }
  func setupNameFilmLabel(){
    contentView.addSubview(nameFilmLabel)
    nameFilmLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.right.equalToSuperview().inset(10)
    }
  }
  
  func urlToData(urlString: URL?, poster: UIImageView){
    
    guard let url = urlString else{return}
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
      if let error = error {
        print(error.localizedDescription)
      }
        guard let data = data, let imageData = UIImage(data: data) else {return}
      DispatchQueue.main.async {
        poster.image = imageData
      }
    })
    task.resume()
  }
}

