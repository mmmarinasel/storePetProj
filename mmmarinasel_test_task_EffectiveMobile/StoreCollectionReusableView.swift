import UIKit

struct HeaderModel {
    var title: String
    var buttonText: String
}

class StoreCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    static var id: String = "CollectionViewHeaderReusableView"
    
    let headerModel: [HeaderModel] = [
        HeaderModel(title: "Select Category", buttonText: "view all"),
        HeaderModel(title: "Hot Sales", buttonText: "see more"),
        HeaderModel(title: "Best Seller", buttonText: "see more")]
    
    func setup(section: Int) {
        self.titleLabel.text = self.headerModel[section].title
//        self.seeMoreButton.titleLabel?.text = titleForButton
        self.seeMoreButton.setTitle(self.headerModel[section].buttonText, for: .normal)
    }
}
