import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var posts: [PostModel] = []
  
  func fetchPosts() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let decodedPosts = try? JSONDecoder().decode([PostModel].self, from: data) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.posts = decodedPosts
          }
        }
      }
    }.resume()
  }
}
