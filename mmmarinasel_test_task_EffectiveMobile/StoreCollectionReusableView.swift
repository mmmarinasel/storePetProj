import UIKit

class StoreCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    func setup(titleForLabel: String, titleForButton: String) {
        self.titleLabel.text = titleForLabel
//        self.seeMoreButton.titleLabel?.text = titleForButton
        self.seeMoreButton.setTitle(titleForButton, for: .normal)
    }
}
