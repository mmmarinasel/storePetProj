import SwiftUI

struct TabBar: View {
    @State var current = "Explorer"
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $current) {
//                Text("Explorer")
//                    .tag("Explorer")
//                Text("Cart")
//                    .tag("Cart")
//                Text("Favorite")
//                    .tag("Favorite")
//                Text("Profile")
//                    .tag("Profile")
                Text("")
                    .tag("Explorer")
                Text("")
                    .tag("Cart")
                Text("")
                    .tag("Favorite")
                Text("")
                    .tag("Profile")
            }
            HStack(spacing: 0){
                TabButton(title: "Explorer", image: "circle_icon", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Cart", image: "bag_icon", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Favorite", image: "icons8-favorite-40", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Profile", image: "icons8-user-40", selected: $current)
            }
//            .padding(.vertical, 12)
//            .padding(.horizontal)
            .background(Color.init(UIColor(red: 1/255, green: 0, blue: 53/255, alpha: 1).cgColor))
//            .background(.red)
            .clipShape(Capsule())
//            .padding(.horizontal, 25)
            .frame(width: 300, height: 72, alignment: Alignment(horizontal: .leading, vertical: .center))
        }
    }
}
