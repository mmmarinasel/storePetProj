import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func setup(category: Category?) {
        guard let category = category else { return }
        let containerView = UIView()
        containerView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 71).isActive = true
        self.stackView.addArrangedSubview(containerView)
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 50,
                                            height: 50))
        button.layer.cornerRadius = button.frame.width / 2
        button.clipsToBounds = true
        button.setImage(category.imageSelected, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        containerView.addSubview(button)
        let label = UILabel(frame: CGRect(x: 0,
                                          y: button.frame.maxY + 7,
                                          width: button.frame.width,
                                          height: 15))
        label.font = label.font.withSize(11)
        label.text = category.name
        label.textAlignment = .center
        containerView.addSubview(label)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("button tapped")
    }
}
