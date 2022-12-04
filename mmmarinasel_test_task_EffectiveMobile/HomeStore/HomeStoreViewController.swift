import UIKit

class HomeStoreViewController: UIViewController {
    
    @IBOutlet weak var homeStoreCollectionView: UICollectionView!
    
    private let viewModel = HomeStoreViewModel()
    
    private let categoriesCellId: String = "categoriesCellId"
    private let headerId: String = "CollectionViewHeaderReusableView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.categories.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.homeStoreCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeStoreCollectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in

            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(95), heightDimension: .absolute(95)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 10
            section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
            guard let self = self else { return section }
            section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            section.supplementaryContentInsetsReference = UIContentInsetsReference.none
            return section
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
        
}

extension HomeStoreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return self.viewModel.categories.value?.count ?? 0
        case 1: return 0
        case 2: return 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.categoriesCellId,
                                                            for: indexPath) as? CategoriesCollectionViewCell
        else { return CategoriesCollectionViewCell() }
//        cell.backgroundColor = .systemPink
        if let categCount = self.viewModel.categories.value?.count {
            for _ in 0..<categCount {
                cell.setup(category: self.viewModel.categories.value?[indexPath.row])
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.headerId, for: indexPath) as? StoreCollectionReusableView
            else { return UICollectionReusableView() }
            header.setup(titleForLabel: "Select Category", titleForButton: "view all")
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
extension HomeStoreViewController: UICollectionViewDelegate {
    
}
