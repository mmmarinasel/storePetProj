import SwiftUI

struct ColorButton: View {
    
    var color: Color
    @Binding var selectedColor: Color
    
    var body: some View {
        ZStack {
            Button(action: {
                self.selectedColor = color
            }) {
                if selectedColor == color {
                    Image("checkmark")
                } else {
                    Image("checkmark")
                        .hidden()
                }
            }
            .background(color)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
        }
        .onTapGesture {
            withAnimation { selectedColor = color }
        }
    }
}
