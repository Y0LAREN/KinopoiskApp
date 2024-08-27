//
//  NetworkService.swift
//  M22.2
//
//  Created by Илья Иванов on 07.08.2024.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol{
  
  func createdURL(urlString: String, userInput: String?) -> URL
  
  func fetchingData(urlNetwork: URL, completion: @escaping (GeneralViewModel) -> Void)
  
}

class NetworkService: NetworkServiceProtocol{
  
  func createdURL(urlString: String, userInput: String?) -> URL {
    guard let url = URL(string: (urlString + (userInput ?? ""))) else{return URL(string: ConstantsRequest.urlToSearchByNameTypeString)!}
    return url
  }
  
  func fetchingData(urlNetwork: URL, completion: @escaping (GeneralViewModel) -> Void) {
    print(urlNetwork)
    AF.request(urlNetwork,
               headers: [ "X-API-KEY" : "69352346-76a6-4ed5-a233-346dc7cc7127",
                          "Content-Type": "application/json"]
    ).response {response in
      guard response.error == nil else{return}
      guard let data = response.data else{return}
      
      do {
        let decoder = JSONDecoder()
        let parsingJSON = try decoder.decode(GeneralViewModel.self, from: data)
        completion(parsingJSON)
        print(parsingJSON)
      }catch {
        print("Ошибка преобразования JSON: \(error.localizedDescription)")
      }
    }
  }
  
}
