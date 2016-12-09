//
//  VideoViewController.swift
//  iMusic
//
//  Created by Akiro on 28/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class VideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let dataHelper = MultimediaDataHelper.sharedInstance
    var indentifier : String = "reuseIdentifier"
    var videoList :[Video] = []
    
    var player = AVPlayer()
    
    //----------------------
    // View Part
    //----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.getVideos()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let bar = self.navigationController?.navigationBar
        bar?.barStyle = UIBarStyle.blackOpaque
        bar?.tintColor = UIColor.red
        bar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func displayMessage(title : String, message : String){
        let displayTitle = (title == "" ? "Attention" : title)
        
        let alert = UIAlertController(title: displayTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    //----------------------
    // TableView Part
    //----------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videoList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        let video = self.videoList[(indexPath as NSIndexPath).row];
        cell.textLabel?.text = video.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentVideo : Video = self.videoList[(indexPath as NSIndexPath).row];
        playVideo(url: URL(string: dataHelper.urlPathVideo + currentVideo.id)!)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
        }
    }
    
    
    func getVideos()->Void{
        dataHelper.videos(){
            (result: [Video]) in
            self.videoList = result
            self.refreshTableView()
        }
    }
    
    func refreshTableView(){
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    //----------------------
    // Player Part
    //----------------------
    
    func playVideo(url : URL) {
        let url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!

//        if let videoUrl = Bundle.main.bundleURL(forResource : "sparta", withExtension:"mp4"){
//            let videoPlayer = AVPlayer(url : videoUrl)
//            let videoPlayerViewController = AVPlayerViewController()
//            videoPlayerViewController.player = videoPlayer
//            self.present(videoPlayerViewController, animated: true, completion: {
//                videoPlayer.play()
//            })
//        }

    

        let player = AVPlayer(url: url as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}
