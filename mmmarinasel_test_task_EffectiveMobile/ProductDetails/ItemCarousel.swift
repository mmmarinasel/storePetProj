import SwiftUI

struct ItemCarousel: View {

    var model: ProductDetailsViewModel = ProductDetailsViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 30) {
                    ForEach(1..<4) { i in
                        GeometryReader { proxy in
                            let scale = getScale(proxy: proxy)
                            
                            VStack(spacing: 8) {
                                Image("puppy")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 180)
                                    .clipped()
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(white: 0.4))
                                        )
                                        .shadow(radius: 3)
//                                Text("Avenger")
//                                    .font(.system(size: 16, weight: .semibold))
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.black)
                            }
                            .scaleEffect(.init(width: scale, height: scale))
                            .animation(.easeOut(duration: 1))
                            .padding(.vertical)
                        }
                        .frame(width: 125, height: 330)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 32)
                    }
                    Spacer()
                        .frame(width: 16)
                }
            }
        }
    }
    
    func getScale(proxy: GeometryProxy) -> CGFloat {
        let midPoint: CGFloat = 125
        let viewFrame = proxy.frame(in: CoordinateSpace.global)
        
        var scale: CGFloat = 1.0
        let deltaXAnimationThreshold: CGFloat = 125
        
        let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
        if diffFromCenter < deltaXAnimationThreshold {
            scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
        }
        return scale
    }
}

struct ItemCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ItemCarousel()
    }
}
