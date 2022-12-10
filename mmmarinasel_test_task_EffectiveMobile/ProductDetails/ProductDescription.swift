import SwiftUI

struct ProductDescription: View {
    
    let backButtonColor = Color(UIColor(red: 1 / 255,
                                         green: 0,
                                         blue: 53 / 255,
                                         alpha: 1))
    let cartButtonColor = Color(UIColor(red: 255 / 255,
                                        green: 110 / 255,
                                        blue: 78 / 255,
                                        alpha: 1))
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 7) {
                    ItemCarousel()
                    DescriptionView()
                }
            }.navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("to cart")
                        }) {
                            Image("bag_icon")
                                .background(self.cartButtonColor)
                                .cornerRadius(10)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("BACK")
                        }) {
                            Image("chevron_left_icon")
                                .foregroundColor(.white)
                                .background(self.backButtonColor)
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
