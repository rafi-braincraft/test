import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            var str = "Hello"
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(str)
        }
    }
}
