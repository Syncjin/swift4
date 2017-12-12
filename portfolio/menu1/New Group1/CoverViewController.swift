//
//  CoverViewController.swift
//  portfolio
//
//  Created by 이우진 on 2017. 12. 3..
//  Copyright © 2017년 Sync. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController {

    var ItemGroupIndex = Int()
    var ItemIndex = Int()
    
    var ItemGroupSetData = [ItemGroup]()
    var ItemGroupData = ItemGroup()
    var ItemData = Item()
    
    @IBOutlet weak var BackImageView: UIImageView!
    @IBOutlet weak var MovieTitleLabel: UILabel!
    @IBOutlet weak var MovieDirectorLabel: UILabel!
    @IBOutlet weak var MovieGenreLabel: UILabel!
    @IBOutlet weak var MovieActorTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemGroupIndex = UserDefaults.standard.object(forKey: "ItemGroupIndex") as! Int
        ItemIndex = UserDefaults.standard.object(forKey: "ItemIndex") as! Int
        ItemGroupSetData = ItemGroup().AddItem()
        ItemGroupData = ItemGroupSetData[ItemGroupIndex]
        ItemData = ItemGroupData.ItemSet[ItemIndex]
        // Do any additional setup after loading the view.
        
        BackImageView.image = UIImage(named: ItemData.ItemImageName)
        MovieTitleLabel.text = ItemData.ItemTitleLabel
        MovieDirectorLabel.text = ItemData.Director
        MovieGenreLabel.text = ItemData.Genre
        
        var actors = String()
        for actor in ItemData.Actor{
             actors += (actor + ". ")
        }
        MovieActorTextView.text = actors
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
