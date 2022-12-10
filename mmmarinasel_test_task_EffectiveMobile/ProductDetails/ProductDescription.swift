import SwiftUI

struct ProductDescription: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ItemCarousel(categoryName: "Samsung")
            }.navigationTitle("Product Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProductDescription_Previews: PreviewProvider {
    static var previews: some View {
        ProductDescription()
    }
}
