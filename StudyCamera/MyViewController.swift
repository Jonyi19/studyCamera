//
//  MyViewController.swift
//  StudyCamera
//
//  Created by Jonyi19 on 2015/11/04.
//  Copyright © 2015年  All rights reserved.
//  githubに登録

import Foundation
import UIKit

 /// メインクラス

class MyViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var images:[UIImage] = Array()
    
    var selectedRow:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")

    }
    
    /**
    テーブルのセクションの数
    
    - parameter tableView: <#tableView description#>
    
    - returns: セグメントの数を返す
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
     cellの数の指定
     
     - parameter tableView: <#tableView description#>
     - parameter section:   <#section description#>
     
     - returns: 挿入したimagesの数だけ返す
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    /**
    Cellの生成
    
    - parameter tableView: <#tableView description#>
    - parameter indexPath: <#indexPath description#>
    
    - returns: <#return value description#>
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myTableView", forIndexPath: indexPath) as! ImageTableViewCell
        
       cell.myImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedRow = indexPath.row
        
        self.performSegueWithIdentifier("OpenImageSegue", sender: nil)
    }

    /**
     
     
     - parameter segue:  <#segue description#>
     - parameter sender: <#sender description#>
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OpenImageSegue" {
            let vc = segue.destinationViewController as! DetailImageViewController
            vc.image = images[selectedRow!]
        }
    }
    
    /**
     ボタンを押すとフォトライブラリーを呼ぶ
     
     - parameter sender: わかんない
     */
    @IBAction func didTouchButton(sender: AnyObject) {
        print("Hello")
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    /**
     フォトライブラリーを画面にセット
     
     - parameter picker: 聞く
     - parameter info: 聞く
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append(image)
            myTableView.reloadData()
            
            //myTableView.image = image
            
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
/// セルの中のViewのクラス
class ImageTableViewCell : UITableViewCell{
    
    @IBOutlet weak var myImageView: UIImageView!
}

/**
詳細画面のクラス
*/
class DetailImageViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    weak var image:UIImage?
    
    override func viewDidLoad() {
        myImageView.image = image
    }
}