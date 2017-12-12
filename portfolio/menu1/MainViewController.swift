//
//  MainViewController.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 1..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // Collectionview를 사용할때 메인스토리보드에서 델리게이트랑 데이타소스를 연결해준다.
    // CellSize를 조절할땐 UICollectionViewDelegateFlowLayout을 사용
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
     var isSlidemenuHidden = true
    
    var ItemGroupSetData = [ItemGroup]()
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuConstraint.constant = -158
        
        let idtext = UserDefaults.standard.object(forKey: "userid") as? String
        userIdLabel.text = idtext! + "님"
        welcomeLabel.text = "환영합니다"
        ItemGroupSetData = ItemGroup().AddItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 몇개의 셀을 그릴지 정하는 곳
        return ItemGroupSetData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 어떠한 셀을 사용할지 정하는 곳
        if indexPath.row == 1 {
            let SecondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCollectionViewCell
            SecondCell.ItemGroupData = ItemGroupSetData[indexPath.row]
            SecondCell.SecondCellSubTitle.text = ItemGroupSetData[indexPath.row].ItemGroupTitleLabel
            SecondCell.ItemGroupIndex = indexPath.row // 몇번째 큰 셀인지 넘김
            SecondCell.MainVC = self //메인의 값,함수들 전달
            return SecondCell
        }
        let FirstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCollectionViewCell
        FirstCell.ItemGroupData = ItemGroupSetData[indexPath.row]
        FirstCell.FirstCellSubTitle.text = ItemGroupSetData[indexPath.row].ItemGroupTitleLabel
        FirstCell.ItemGroupIndex = indexPath.row // 몇번째 큰 셀인지 넘김
        FirstCell.MainVC = self //메인의 값,함수들 전달
        return FirstCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 셀을 클릭했을때 어떻게 할지 정하는 곳, Item당 IndexPath.row로 접근 가능 0~
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 셀 사이즈 조절하는 곳
        if indexPath.row == 1 {
            return CGSize(width:view.frame.width,height: 200) // 가로화면을 화면의 가로에 맞게
        }
        
        if indexPath.row == 2 {
            return CGSize(width:view.frame.width,height: 500) // 아이템이 더 보여서 스크롤할 수 있다는 것을 보여주기 위해 height를 늘린다
        }
        
        return CGSize(width:view.frame.width,height: 450) // 다
    }

    func ToContent() {
        performSegue(withIdentifier: "ToContent", sender: self)
    }
    
    @IBAction func MenuButton(_ sender: UIButton) {
        if isSlidemenuHidden {
            sideMenuConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            sideMenuConstraint.constant = -158
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSlidemenuHidden = !isSlidemenuHidden
    }
}
