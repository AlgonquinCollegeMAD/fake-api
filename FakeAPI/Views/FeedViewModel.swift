import SwiftUI

enum FeedViewState {
  case loading
  case empty
  case idle([PostModel])
}

class FeedViewModel: ObservableObject {
  @Published var viewState: FeedViewState = .empty
  
  func fetchPosts() {
    viewState = .loading

    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let decodedPosts = try? JSONDecoder().decode([PostModel].self, from: data) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.viewState = .idle(decodedPosts)
          }
        }
      }
    }.resume()
  }
}
