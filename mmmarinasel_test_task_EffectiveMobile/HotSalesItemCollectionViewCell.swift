import UIKit

class HotSalesItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var isNewView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!    
    @IBOutlet weak var addToCartButton: UIButton!
    
    static var id: String = "hotSalesItemCellId"
    
    func setup(item: HotSalesItem?) {
        guard let item = item else { return }
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.subtitle
        self.addToCartButton.layer.cornerRadius = 5
        guard let isNew = item.isNew else { return }
        if isNew {
            self.isNewView.isHidden = false
            self.isNewView.layer.cornerRadius = self.isNewView.frame.width / 2
            self.isNewView.clipsToBounds = true
        } else {
            self.isNewView.isHidden = true
        }
    }
    
    func setImage(image: UIImage) {
        self.itemImageView.image = image
        self.itemImageView.layer.cornerRadius = 10
        self.itemImageView.clipsToBounds = true
    }
}
