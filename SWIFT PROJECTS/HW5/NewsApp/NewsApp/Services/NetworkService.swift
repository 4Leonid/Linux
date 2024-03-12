//
//  NetworkService.swift
//  NewsApp
//
//  Created by Леонид Турко on 11.03.2024.
//

import Foundation

final class NetworkService {
  func getNews(completion: @escaping ([News]) -> ()) {
    guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=id,title,publication_date&text_format=text&actual_only=true") else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data else { return }
      
      do {
        let decoder = JSONDecoder()
        let news = try decoder.decode(NewsModel.self, from: data)
        completion(news.results)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
}
