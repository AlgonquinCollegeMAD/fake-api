import SwiftUI

struct FeedView: View {
  @StateObject var model = FeedViewModel()
    
  var body: some View {
    VStack {
      Button("Fetch Posts") {
        model.fetchPosts()
      }
      
      List(model.posts, id: \.id) { post in
        VStack(alignment: .leading) {
          
          Text(post.title)
            .font(.title)
            .foregroundStyle(.brown)
          
          Text(post.body)
        }
      }
    }
  }
}

