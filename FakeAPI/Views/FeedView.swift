import SwiftUI

struct FeedView: View {
  @StateObject var model = FeedViewModel()
  
  var body: some View {
    VStack {
      switch model.viewState {
        
      case .loading:
        ProgressView {
          Text("Loading posts...")
        }
      case .empty:
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
      case .idle(let posts):
        List(posts, id: \.id) { post in
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

