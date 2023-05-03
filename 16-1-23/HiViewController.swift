//
//  HiViewController.swift
//  16-1-23
//
//  Created by R86 on 17/03/23.
//

import UIKit

class HiViewController: UIViewController {

    @IBOutlet weak var hiCollectionView: UICollectionView!
    
    
    var arrHi: String = "1234567890"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
registerNib()
        // Do any additional setup after loading the view.
    }
    
    func registerNib() {
        hiCollectionView.register(UINib(nibName: "HiCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HiCollectionViewCell")
    }
}

extension HiViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrHi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HiCollectionViewCell = hiCollectionView.dequeueReusableCell(withReuseIdentifier: "HiCollectionViewCell", for: indexPath) as! HiCollectionViewCell
        cell.nameLable.text = "\(arrHi)"
        return cell
    }
    
    
}
