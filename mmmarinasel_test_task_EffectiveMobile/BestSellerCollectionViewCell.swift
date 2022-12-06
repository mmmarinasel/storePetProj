import UIKit

struct BestSellerCellViewModel {
    
}

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var setFavoriteButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let id: String = "bestSellerCollectionViewCell"
    
    func setup(item: BestSeller?) {
        guard let item = item else { return }
        self.priceLabel.text = "$\(item.discountPrice)"
        self.discountLabel.text = "$\(item.priceWithoutDiscount)"
//        self.discountLabel.attributedText = 
        self.titleLabel.text = item.title
        if item.isFavorites {
            self.setFavoriteButton.setImage(UIImage(systemName: "heart.fill"),
                                            for: .normal)
        } else {
            self.setFavoriteButton.setImage(UIImage(systemName: "heart"),
                                            for: .normal)
        }
    }
    
    func setImage(image: UIImage) {
        self.itemImageView.image = image
    }
}
