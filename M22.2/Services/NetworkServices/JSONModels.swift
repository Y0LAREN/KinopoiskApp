import Foundation

// MARK: - General
struct GeneralViewModel: Decodable{
  
  let keyword: String?
  let pagesCount: Int?
  let films: [FilmsGeneral]?
  let searchFilmsCountResult: Int?
  let total, totalPages: Int?
  let items: [ItemGeneral]?
  
}

// MARK: - Film
struct FilmsGeneral: Decodable{
  
  let filmId: Int?
  let nameRu, nameEn, type, year: String?
  let description, filmLength: String?
  let rating: String?
  let ratingVoteCount: Int?
  let posterUrl, posterUrlPreview: String?
  
}

// MARK: - Item
struct ItemGeneral: Decodable {
  
    let kinopoiskId: Int?
    let imdbId: String?
    let nameRu: String?
    let nameOriginal: String?
    let ratingKinopoisk, ratingImdb: Double?
    let year: Int?
    let type: String?
    let posterUrl, posterUrlPreview: String?
    let coverUrl: String?
    let logoUrl: String?
    let description: String?
    let ratingAgeLimits: String?
  
}

