//
//  BaseMainView.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

class BaseMainView: UIView {
    
    typealias  VFP = VisualFormatPatterns
    
    private let headerView = BaseHeaderView()
    private var viewModel = BaseViewModel()
    
    lazy var flickrCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collView = UICollectionView(frame: CGRect.zero,
                                        collectionViewLayout: flowLayout)
        collView.backgroundColor = UIColor.clear
        collView.backgroundColor?.withAlphaComponent(0.5)
        collView.register(BaseFlickrPhotoCell.self,
                          forCellWithReuseIdentifier: BaseFlickrPhotoCell.identifier)
        
        collView.delegate = self
        collView.dataSource = self
        
        return collView
    }()
    
    private var columnsNumber: CGFloat = 2.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func start() {
        configureLayout()
        headerView.start()
        reload()
    }
    
    func reload() {
        self.flickrCollectionView.reloadData()
    }
    
    func setFrom(controller: MyBaseViewController) {
        self.viewModel = controller.viewModel
        self.headerView.searchDelegate = controller
    }
    
    func configureLayout() {
        addSubview(headerView)
        addSubview(flickrCollectionView)

        setUpContraints(pattern: "V:|-[v0(72)]-[v1]|",
                        options: .alignAllCenterX,
                        views: headerView, flickrCollectionView)
        setUpContraints(pattern: VFP.fullHorTotal, options: .alignAllCenterY,
                        views: headerView)
        setUpContraints(pattern: VFP.fullHorSmall, options: .alignAllCenterY,
                        views: flickrCollectionView)
    }
    
    func loadNextPage() {
        viewModel.fetchNextPage {
            DispatchQueue.main.async {
                self.flickrCollectionView.reloadData()

            }
        }
    }
}

//MARK:- UICollectionViewDelegate
extension BaseMainView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: true,
                                  scrollPosition: .centeredVertically)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let flickrCell = cell as? BaseFlickrPhotoCell else {
            return
        }
        
        let item = viewModel.photos[indexPath.row]
        flickrCell.setupData(urlString: item.imageStringURL(imageSize: .largeSquare),
                             title: item.title)
        
        if indexPath.row == (viewModel.photos.count - 6) {
            loadNextPage()
        }
    }
   
}

//MARK:- UICollectionViewDataSource
extension BaseMainView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseFlickrPhotoCell.identifier, for: indexPath) as? BaseFlickrPhotoCell {
            cell.imageView.image = UIImage(named: StringConstants.kPlaceHoderName)
            
            return cell
        }
        
        return BaseFlickrPhotoCell()
    }

}

//MARK:- UICollectionViewDelegateFlowLayout
extension BaseMainView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.bounds.width * 0.90) / columnsNumber,
                      height: (collectionView.bounds.height * 0.75) / columnsNumber)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 6,
                            bottom: 4, right: 8)
    }
}




