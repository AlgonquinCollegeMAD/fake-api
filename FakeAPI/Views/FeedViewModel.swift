import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var posts: [PostModel] = []
  @Published var isLoading = false
  
  func fetchPosts() {
    isLoading = true

    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let decodedPosts = try? JSONDecoder().decode([PostModel].self, from: data) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.posts = decodedPosts
            self.isLoading = false
          }
        }
      }
    }.resume()
  }
}
