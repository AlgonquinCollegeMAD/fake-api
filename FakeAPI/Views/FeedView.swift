import SwiftUI

struct FeedView: View {
  @StateObject var model = FeedViewModel()
  
  var body: some View {
    VStack {
      if model.posts.isEmpty {

        VStack {
          Text("Nothing to see here")
          
          Button("Fetch Posts") {
            model.fetchPosts()
          }
        }

      } else {
        
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

