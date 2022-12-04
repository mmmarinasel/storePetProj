import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func setup(category: Category?) {
        guard let category = category else { return }
//        let button = UIButton()
//        button.heightAnchor.constraint(equalToConstant: 93).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 71).isActive = true
//        button.setImage(category.imageSelected, for: .normal)
//        button.setTitle(category.name, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 12)
//        button.layer.cornerRadius = button.frame.width / 2
//        button.clipsToBounds = true
//        button.contentVerticalAlignment = .top
////        button.p
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
////        self.category2button.append(CategoryButton(categoryId: categoryId, button: button))
//        self.stackView.addArrangedSubview(button)
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
        containerView.addSubview(button)
        let label = UILabel(frame: CGRect(x: 0,
                                          y: button.frame.maxY + 7,
                                          width: button.frame.width,
                                          height: 15))
        label.font = UIFont(name: "System", size: 12)
        label.text = category.name
        containerView.addSubview(label)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("button tapped")
    }
}
