import SwiftUI

struct ItemsView: View {
    var body: some View {
//        List(0 ..< 5) { item in
//        List(0..<3) { item in
        HStack {
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("Galaxy Note 20 Ultra")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("$3000.00")
                    .foregroundColor(Color("orange"))
                    .font(.headline)
            }
            AmountView()
                .padding(.leading, 33)
            Button(action: {
                
            }) {
                Image(systemName: "trash")
                    .foregroundColor(Color("trash_color"))
                    .imageScale(.small)
            }
            .padding(.leading, 17)
        }
        .background(Color("deep_blue"))
    }
}

struct AmountView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                Image(systemName: "minus")
                    .imageScale(.small)
                    .foregroundColor(.white)
            }
            Text("1")
//                .background(Color("amount_gray"))
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 6)
                .padding(.bottom, 6)
            Button(action: {
                
            }) {
                Image(systemName: "plus")
                    .imageScale(.small)
                    .foregroundColor(.white)
            }
            
        }
        .frame(width: 26, height: 68)
        .background(Color("amount_gray"))
        .cornerRadius(26)
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
