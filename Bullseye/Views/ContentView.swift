//Princianna Durosier
import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 20.0
  @State private var game = Game()
  
  
  var body: some View {
    VStack {
      VStack {
        VStack {
          Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .kerning(2.0)
          Text(String(game.target))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
          HStack {
            Text("1")
              .bold()
            Slider(value: $sliderValue, in: 1.0...100.0)
            Text("100")
              .bold()
          }
          Button("Hit ME") {
            alertIsVisible = true
          }
          .alert(
            "Hello there!",
            isPresented: $alertIsVisible,
            actions: {
              Button("Awesome") {
                print("Alert closed")
              }
            }, message: {
              let roundedValue = Int(sliderValue.rounded())
              Text("""
                 The slider's value is \(roundedValue).
                  Your scored \(game.points(sliderValue: roundedValue)) points this round.
               """)
            }
          )
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
