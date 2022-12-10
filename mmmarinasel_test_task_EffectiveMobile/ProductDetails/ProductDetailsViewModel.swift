import Foundation
import UIKit.UIImage

class ProductDetailsViewModel {
    var details: Observable<ProductDetails?> = Observable(nil)
    var images: Observable<[UIImage]> = Observable([])
    
    init() {
        NetworkManager.getJson(urlString: NetworkManager.productDetailsUrl) { [weak self] productDetails in
            let details: ProductDetails = productDetails
            self?.details.value = details
        }
    }
    
}
