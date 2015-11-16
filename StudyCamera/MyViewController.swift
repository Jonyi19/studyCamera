//
//  MyViewController.swift
//  StudyCamera
//
//  Created by Jonyi19 on 2015/11/04.
//  Copyright © 2015年  All rights reserved.
//  githubに登録

import Foundation
import UIKit

class MyViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var images:[UIImage] = Array()
    
    var selectedRow:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")

    }
    
    //テーブルのセクションの数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //cellの数の指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    //Cellの生成
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myTableView", forIndexPath: indexPath) as! ImageTableViewCell
      //  cell.textLabel?.text = "test"
        
       cell.myImageView.image = images[indexPath.row]
        
        return cell
    }

    
    
    @IBAction func didTouchButton(sender: AnyObject) {//ボタンを押すとフォトライブラリーを呼ぶ
        print("Hello")
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {//フォトライブラリーを画面にセット
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            images.append(image)
            myTableView.reloadData()
            
            //myTableView.image = image
            
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

class ImageTableViewCell : UITableViewCell{
    
    @IBOutlet weak var myImageView: UIImageView!
}