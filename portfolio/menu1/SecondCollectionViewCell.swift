//
//  SecondCollectionViewCell.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 2..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var SecondCellSubTitle: UILabel!
    
    var ItemGroupData = ItemGroup()
    var ItemGroupIndex = Int()
    var MainVC = MainViewController()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemGroupData.ItemSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let SubSecondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubSecondCell", for: indexPath) as! SubSecondCollectionViewCell
        let ItemImageName = ItemGroupData.ItemSet[indexPath.row].ItemImageName
        let ItemTitle = ItemGroupData.ItemSet[indexPath.row].ItemTitleLabel
        SubSecondCell.SubSecondImageView.image = UIImage(named: ItemImageName)
        SubSecondCell.SubSecondLabel.text = ItemTitle
        /* 이미지 애니메이션 */
        SubSecondCell.SubSecondImageView.clipsToBounds = true
//                SubSecondCell.SubSecondImageView.layer.cornerRadius = 20
        SubSecondCell.SubSecondImageView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        // 이미지뷰 라운드처리하는데 오른쪽 아래 왼쪽 위만 깍는다.
        UIViewPropertyAnimator(duration: 2.0, curve: .easeIn) { SubSecondCell.SubSecondImageView.layer.cornerRadius = 20 }.startAnimation()
        // 라운드처리하는걸 애니메이션 처리
        
        return SubSecondCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width-40)/3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("secondcell",indexPath.row)
        UserDefaults.standard.set(ItemGroupIndex, forKey: "ItemGroupIndex")
        UserDefaults.standard.set(indexPath.row, forKey: "ItemIndex")
        MainVC.ToContent()
    }
    
}
