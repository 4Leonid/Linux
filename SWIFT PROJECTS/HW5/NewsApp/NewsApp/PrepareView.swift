//
//  PrepareView.swift
//  NewsApp
//
//  Created by Леонид Турко on 11.03.2024.
//

import SwiftUI

struct PrepareView: View {
  var body: some View {
    NavigationStack {
      NavigationLink("Go to news", destination: ContentView())
    }
  }
}

struct NewsView_Previews: PreviewProvider {
  static var previews: some View {
    PrepareView()
  }
}