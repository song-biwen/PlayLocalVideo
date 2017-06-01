//
//  MyTableCell.swift
//  WZPlayLocalVideo

//  Created by songbiwen on 2017/6/1.
//  Copyright © 2017年 songbiwen. All rights reserved.
//

/*
 
 cell.bgImageView.image = UIImage(named: dict.image);
 cell.contentLabel.text = dict.title;
 cell.detailLabel.text = dict.source;
 
 
 cell.playButton.addTarget(self, action: #selector(playButtonAction(button:)), for: UIControlEvents.touchUpInside);
 
 */

import UIKit
import AVKit
import AVFoundation

struct video {
    let image:String
    let title:String
    let source:String
    
}
class MyTableCell: UITableViewCell {

    var bgImageView = UIImageView();
    var contentLabel = UILabel();
    var detailLabel = UILabel();
    var playButton = UIButton();
    var currentVideo = video(image: "", title: "", source: "");
    var playerVC = AVPlayerViewController();
    var playerView = AVPlayer();
    
    
    //给控件赋值
    func setValueForCell(myVideo:video) {
        bgImageView.image = UIImage(named: myVideo.image);
        contentLabel.text = myVideo.title;
        detailLabel.text = myVideo.source;
        currentVideo = myVideo;
        
    }
    
    static func cell(tableView:UITableView) -> MyTableCell {
        var  cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell") as? MyTableCell;
        
        if (cell == nil) {
            cell = MyTableCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "MyTableCell");
        }
        return cell!;
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //创建UI
    func setupUI() {
        bgImageView.frame = self.contentView.frame;
        self.contentView.addSubview(bgImageView);
        
        
        playButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60);
        playButton.center = self.contentView.center;
        playButton.setImage(UIImage(named:"playBtn"), for: UIControlState.normal);
        playButton.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside);
        self.contentView.addSubview(playButton);
        
        contentLabel.frame = CGRect(x: 0, y: playButton.frame.origin.y + playButton.frame.size.height, width: self.contentView.frame.size.width, height: 20);
        contentLabel.textColor = UIColor.white;
        contentLabel.textAlignment = NSTextAlignment.center;
        self.contentView.addSubview(contentLabel);
        
        
        detailLabel.frame = CGRect(x: 0, y: contentLabel.frame.origin.y + contentLabel.frame.size.height, width: self.contentView.frame.size.width, height: 20);
        detailLabel.textColor = UIColor.lightGray;
        detailLabel.font = UIFont.systemFont(ofSize: 12);
        detailLabel.textAlignment = NSTextAlignment.center;
        self.contentView.addSubview(detailLabel);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        bgImageView.frame = self.contentView.frame;
        playButton.center = self.contentView.center;
        contentLabel.frame = CGRect(x: 0, y: playButton.frame.origin.y + playButton.frame.size.height, width: self.contentView.frame.size.width, height: 20);
        detailLabel.frame = CGRect(x: 0, y: contentLabel.frame.origin.y + contentLabel.frame.size.height, width: self.contentView.frame.size.width, height: 20);
    }
    
    
    func buttonClick() {
        print(currentVideo);
        let path = Bundle.main.path(forResource: "庄心妍-以后的以后", ofType: "mp3")
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        
        playerVC.player = playerView
        
        
        let window = UIApplication.shared.keyWindow;
        
        window?.rootViewController!.present(playerVC, animated: true) {
            self.playerVC.player?.play()
        }
        
        
    }
}
