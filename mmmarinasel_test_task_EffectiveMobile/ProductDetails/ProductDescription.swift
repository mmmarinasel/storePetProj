import SwiftUI

struct ProductDescription: View {

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 7) {
                    ItemCarousel()
                    DescriptionView()
                }
            }
            .background(Color("wh"))
            .navigationTitle("Product Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("to cart")
                    }) {
                        Image("bag_icon")
                            .background(Color("orange"))
                            .cornerRadius(10)
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

struct ProductDescription_Previews: PreviewProvider {
    static var previews: some View {
        ProductDescription()
    }
}
