import SwiftUI

struct CapacityButton: View {
    
    var capacity: String
    @Binding var currentButtonTab: Int
    var tab: Int
//    var backgroundColor: Color = .clear
    
    var body: some View {
        Button {
            self.currentButtonTab = tab
        } label: {
//            Text(self.capacity)
            if currentButtonTab == tab {
                Text(self.capacity)
                    .frame(width: 72, height: 31)
                    .background(Color("orange"))
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .cornerRadius(10)
            } else {
                Text(self.capacity)
                    .frame(width: 69, height: 16)
                    .background(.clear)
                    .foregroundColor(Color("capacityGray"))
                    .font(.caption2)
                    .fontWeight(.medium)
            }
        }.animation(.spring(), value: self.currentButtonTab)
    }
}

