//
//  FirstCollectionViewCell.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 2..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit



class FirstCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var FirstCellSubTitle: UILabel!
    
    var ItemGroupData = ItemGroup()
    var ItemGroupIndex = Int()
    var MainVC = MainViewController()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemGroupData.ItemSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let SubFirstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubFirstCell", for: indexPath) as! SubFirstCollectionViewCell
        let ItemImageName = ItemGroupData.ItemSet[indexPath.row].ItemImageName
        let ItemTitle = ItemGroupData.ItemSet[indexPath.row].ItemTitleLabel
        SubFirstCell.SubFirstImageView.image = UIImage(named: ItemImageName)
        SubFirstCell.SubFirstLabel.text = ItemTitle
        
        /* 이미지 애니메이션 */
        SubFirstCell.SubFirstImageView.clipsToBounds = true
//        SubFirstCell.SubFirstImageView.layer.cornerRadius = 20
        SubFirstCell.SubFirstImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        UIViewPropertyAnimator(duration: 2.0, curve: .easeIn) { SubFirstCell.SubFirstImageView.layer.cornerRadius = 20 }.startAnimation()
        
        return SubFirstCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width-30)/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("firstcell",indexPath.row)
        UserDefaults.standard.set(ItemGroupIndex, forKey: "ItemGroupIndex")
        UserDefaults.standard.set(indexPath.row, forKey: "ItemIndex")
        MainVC.ToContent() // 이 클래스는 셀이기 때문에 퍼폼세그가 없다. 따라서 메인뷰컨트롤러에서 퍼폼세그 함수를 만들고 이곳에서 사용한다.
    }
}
