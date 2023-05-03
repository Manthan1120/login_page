//
//  HomePage.swift
//  16-1-23
//
//  Created by R86 on 18/01/23.
//

import UIKit

class HomePage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var CollectionView2: UICollectionView!
    
    var img = [1,2,3,4,5,6,7,8,9,10]
    
    
    var imageArrayForUser = [11,12,13,14,15,16,17,18,19,20]
    
    
    var lableArrayForUserName = ["Manthan","Milan","Kartik","Kirtan","Dev","Saytam","Sneh","Aniket","Ketan"]
    
    var tag = ["add1","add2","add3","add4","add5","add6","add7","add8","add9","add10"]
    
    var selectCell = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CollectionView{
            return tag.count
        }
        return lableArrayForUserName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.CollectionView {
            let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
            
            cell.imageView.image = UIImage(named: "\(img[indexPath.row])")
            cell.lable1.text = tag[indexPath.row]
            return cell
        }
        else{
            let cell2 = CollectionView2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! MyCollectionViewCell2
            
            cell2.imageForUser.image = UIImage(named: "\(imageArrayForUser[indexPath.row])")
            cell2.lableForUserName.text = lableArrayForUserName[indexPath.row]
            
            
            if selectCell == indexPath.row {
                cell2.redioButton.image = UIImage(systemName: "circle.fill")
            }
            else {
                cell2.redioButton.image = UIImage(systemName: "circle")
            }


            return cell2
            
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    
        CollectionView2.reloadData()
        
        
        
    }
}
