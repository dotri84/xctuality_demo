//
//  TimelineViewController.swift
//  Three60Experiences
//
//  Created by Tri Do on 19/02/2022.
//

import UIKit
import Photos
import SDWebImage

class TimelineViewController: UICollectionViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    private var data: [Experience]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = DataManager.shared.getData()
        
        let img = UIImage(named: "navbar-background")
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundImage = img
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "view_background")!)
        
        // Setup the mosaic collection view.
        let mosaicLayout = MosaicLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: mosaicLayout)
        collectionView.backgroundColor = UIColor.appBackgroundColor
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MosaicCell.self, forCellWithReuseIdentifier: MosaicCell.identifer)

        self.view.addSubview(collectionView)

        self.navigationItem.titleView = avatarView

        self.collectionView.reloadData()
    }

    let avatarView = AvatarView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Always show 50K cells so scrolling performance can be tested.
        return 50_000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MosaicCell.identifer, for: indexPath) as? MosaicCell
            else { preconditionFailure("Failed to load collection view cell") }

            let assetIndex = indexPath.item % data.count
        let imageUrl = data[assetIndex].imageUrl

            cell.imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let assetIndex = indexPath.item % data.count
    let link = data[assetIndex].link
        self.performSegue(withIdentifier: "OpenDetail", sender: link)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenDetail" {
            let destVC = segue.destination as! DetailViewController
            destVC.link = sender as! String
        }
    }
}

