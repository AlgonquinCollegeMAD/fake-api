import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var posts: [PostModel] = [PostModel]()
  
  func fetchPosts() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let decodedPosts = try? JSONDecoder().decode([PostModel].self, from: data) {
          self.posts = decodedPosts
        }
      }
    }.resume()
  }
}
