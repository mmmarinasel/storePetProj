import Foundation
import UIKit

class HomeStoreViewModel {
    
//    var sections: [String : Observable<[Codable]>] = [:]
    var categories: Observable<[Category]> = Observable([])
    var hotSales: Observable<[HotSalesItem]> = Observable([])
    var bestSellers: Observable<[BestSeller]> = Observable([])
    
    init() {
        self.categories.value?.append(Category(name: "Phones",
                                               imageDefault: UIImage(named: "phone_icon") ?? UIImage(),
                                               imageSelected: UIImage(named: "phone_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Computer",
                                               imageDefault: UIImage(named: "computer_icon") ?? UIImage(),
                                               imageSelected: UIImage(named: "computer_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Health",
                                        imageDefault: UIImage(named: "health_icon") ?? UIImage(),
                                        imageSelected: UIImage(named: "health_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Books",
                                        imageDefault: UIImage(named: "books_icon") ?? UIImage(),
                                        imageSelected: UIImage(named: "books_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Pet",
                                        imageDefault: UIImage(named: "pet_icon") ?? UIImage(),
                                        imageSelected: UIImage(named: "pet_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Flowers",
                                        imageDefault: UIImage(named: "flower_bouquet_icon") ?? UIImage(),
                                        imageSelected: UIImage(named: "flower_bouquet_icon_fill") ?? UIImage()))
        self.categories.value?.append(Category(name: "Clothes",
                                        imageDefault: UIImage(named: "clothes_icon") ?? UIImage(),
                                        imageSelected: UIImage(named: "clothes_icon_fill") ?? UIImage()))
        
        NetworkManager.getJson(urlString: NetworkManager.homeStoreUrl) { [weak self] storeData in
            let store: Store = storeData
            self?.hotSales.value = store.hotSales
            self?.bestSellers.value = store.bestSellers
//            print(store.hotSales)
        }
        
    }
}

