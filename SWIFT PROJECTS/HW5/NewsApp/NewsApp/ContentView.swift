//
//  ContentView.swift
//  NewsApp
//
//  Created by Леонид Турко on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
  @State var news: [News] = []
  private let networkService = NetworkService()
  
  var body: some View {
    List(news) { news in
      VStack {
        Text(Helper.getDate(date: news.date))
          .font(.body)
          .fontWeight(.light)
        Text(news.title)
          .font(.title)
          .fontWeight(.heavy)
      }
    }
    .onAppear {
      networkService.getNews { news in
        self.news = news
      }
    }
  }
}

#Preview {
  ContentView()
}
