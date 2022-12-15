import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 7) {
                    Text("My Cart")
                        .fontWeight(.bold)
                        .font(.title)
                    ItemsView()
                }
            }
            .background(Color("wh"))
//            .navigationTitle("My Cart")
//            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("to cart")
                    }) {
                        HStack {
                            Text("Add address")
                                .foregroundColor(.black)
                                .font(Font.caption)
                                .padding(.trailing, 9)
                            Image("location_icon37")
                                .background(Color("orange"))
                                .cornerRadius(10)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("BACK")
                    }) {
                        Image("chevron_left_icon")
                            .foregroundColor(.white)
                            .background(Color("deep_blue"))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
