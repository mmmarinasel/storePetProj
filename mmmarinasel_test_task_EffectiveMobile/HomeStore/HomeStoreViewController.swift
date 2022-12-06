import UIKit

class HomeStoreViewController: UIViewController {
    
    enum SectionKind: Int, CaseIterable {
        case categories, hotSales, bestSellers
        var cellCount: Int {
            switch self {
            case .categories:
                return 1
            case .hotSales:
                return 3
            case .bestSellers:
                return 4
            }
        }
    }
    
    @IBOutlet weak var homeStoreCollectionView: UICollectionView!
    
    private let viewModel = HomeStoreViewModel()
    private var isAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.categories.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.homeStoreCollectionView.reloadData()
            }
        }
        self.viewModel.hotSales.bind { [weak self] _ in
            DispatchQueue.main.async {
//                SectionKind.hotSales = self?.viewModel.hotSales.value?.count
                self?.homeStoreCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeStoreCollectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
            let section = SectionKind(rawValue: sectionIndex)
            guard let section = section else { return nil }
            switch section {
            case .categories:
                return self?.createCategoriesSection()
            case .hotSales:
                return self?.createHotSalesSection()
            case .bestSellers:
                return self?.createBestSellersSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    
    
    private func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: /*.absolute(188)*/.fractionalHeight(0.23))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 17,
                                                        bottom: 0,
                                                        trailing: 17)
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        return section
    }
    
    private func createHotSalesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: /*.fractionalHeight(0.21)*/ .absolute(182))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 15,
                                                        bottom: 0,
                                                        trailing: 17)
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        return section
    }
    
    private func createBestSellersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.5))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item,
                                                       count: 2)
//        let spacing = CGFloat(14)
        group.interItemSpacing = .fixed(14)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17)
        section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
}
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
extension HomeStoreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionKind.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = SectionKind(rawValue: section) else { return 0 }
        return section.cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = SectionKind(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch section {
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.id,
                                                          for: indexPath) as? CategoriesCollectionViewCell
            if let categCount = self.viewModel.categories.value?.count,
               !self.isAdded {
                cell?.stackView.spacing = 23
                for i in 0..<categCount {
                    cell?.setup(category: self.viewModel.categories.value?[i])
                }
                self.isAdded = true
            }
            guard let cell = cell else { return UICollectionViewCell() }
            return cell
        case .hotSales:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesItemCollectionViewCell.id,
                                                          for: indexPath) as? HotSalesItemCollectionViewCell
            let item = self.viewModel.hotSales.value
            if let itemsCount = item?.count,
               itemsCount != 0,
               let picUrl = item?[indexPath.row].pictureUrl {
                NetworkManager.loadImageByUrl(urlString: picUrl) { img in
                    cell?.setImage(image: img)
                }
                cell?.setup(item: item?[indexPath.row])
            }
            guard let cell = cell else { return UICollectionViewCell() }
            return cell
        case .bestSellers:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.id,
                                                          for: indexPath) as? BestSellerCollectionViewCell
            let item = self.viewModel.bestSellers.value
            if let itemsCount = item?.count,
               itemsCount != 0,
               let picUrl = item?[indexPath.row].pictureUrl {
                NetworkManager.loadImageByUrl(urlString: picUrl) { img in
                    cell?.setImage(image: img)
                }
                cell?.setup(item: item?[indexPath.row])
            }
            cell?.layer.cornerRadius = 10
            guard let cell = cell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StoreCollectionReusableView.id, for: indexPath) as? StoreCollectionReusableView
            else { return UICollectionReusableView() }
            header.setup(section: indexPath.section)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

