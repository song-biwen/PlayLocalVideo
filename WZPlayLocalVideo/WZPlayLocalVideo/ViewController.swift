//
//  ViewController.swift
//  WZPlayLocalVideo
//
//  Created by songbiwen on 2017/6/1.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var myTableView = UITableView();
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.frame = UIScreen.main.bounds;
        myTableView.backgroundColor = UIColor.black;
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.separatorStyle = .none;
        self.view.addSubview(myTableView);
        
        myTableView.reloadData();
    }

    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let cell = MyTableCell.cell(tableView: myTableView);
        
        cell.setValueForCell(myVideo: data[indexPath.row]);
        
        return cell;
        
    }

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220;
    }
    
}

