import SwiftUI

struct FeedView: View {
  @StateObject var model = FeedViewModel()
  
  var body: some View {
    VStack {
      if model.isLoading {
        ProgressView {
          Text("Loading posts...")
        }
      }
      
      else if model.posts.isEmpty {
        ContentUnavailableView {
          Label("No posts yet", systemImage: "questionmark.app.dashed")
        } description: {
          Text("That is kind of boring")
        } actions: {
          Button("Refresh") {
            model.fetchPosts()
          }
          .buttonStyle(.borderedProminent)
        }
      }
      
      else {
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
}

