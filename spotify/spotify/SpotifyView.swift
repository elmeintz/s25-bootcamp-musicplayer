import SwiftUI

struct SpotifyView: View {
    @State private var volume: Double = 50
    @State private var isPlaying: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.6, green: 0.69, blue: 0.6),  // pastel/light green
                    Color(red: 0.0, green: 0.31, blue: 0.0) // dark green
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                // hstack at the very top of the screen for three components (drop down, playlist name, ellipsis)
                HStack {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 25))
                        .padding(.leading, 15)
                    
                    Spacer()
                    
                    Text("one for the road")
                        .font(.custom("BubbleFont", size: 14))
                        .padding(.vertical, 5)

                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.system(size: 25))
                        .padding(.trailing, 15)
                }
                .frame(maxWidth: .infinity, alignment: .top)  // allign to the top
                .padding(.top, -60)
                
                // content below the HStack
                VStack {
                    Image("noah_k")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .padding(.top, 20)
                    
                    HStack{
                        VStack(alignment: .leading) {
                            Text("All My Love")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 30)
                            
                            Text("Noah Kahan")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        
                        Image(systemName: "heart")
                            .padding(.trailing, 15)
                    }
                    
                    // slider for volume control
                    HStack {
                        Image(systemName: "speaker.fill")
                            .foregroundColor(.white)
                        
                        Slider(value: $volume, in: 0...100)
                            .accentColor(Color(red: 0.0, green: 0.392, blue: 0.0))
                            .padding(.horizontal, 20)
                        
                        Image(systemName: "speaker.2.fill")
                            .foregroundColor(.white)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    
                    // control buttons
                    HStack {
                        // backward button
                        Button(action: {
                        
                        }) {
                            Image(systemName: "backward.end")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(.leading, 40)
                        }
                        
                        Spacer()
                        
                        //
                        Button(action: {
                            // pause button with an icon
                        }) {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        // go forward buttom
                        Button(action: {
                            isPlaying.toggle()
                        }) {
                            Image(systemName: "forward.end")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.trailing, 40)
                        }
                    }
                }
                .padding(.top, 10) //
            }
        }
        .preferredColorScheme(.dark) // show the preview in dark mode
        .padding()
    }
}

#Preview {
    SpotifyView()
}

