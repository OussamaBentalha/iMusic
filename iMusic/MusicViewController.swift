//
//  MusicViewController.swift
//  iMusic
//
//  Created by Akiro on 28/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let dataHelper = MultimediaDataHelper.sharedInstance
    var indentifier : String = "reuseIdentifier"
    var musicList :[Music] = []
    
    var player : AVAudioPlayer! = nil
    
    
    //----------------------
    // View Part
    //----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.getMusics()
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
    
    func launchMusicWithId(musicId : String){
        let musicUrl : String = dataHelper.urlPathMusic + musicId
        self.downloadFileFromURL(URL(string: musicUrl)!)
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
        return self.musicList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = self.musicList[(indexPath as NSIndexPath).row];

//        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
//        
//        cell.textLabel?.text = music.title
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! MusicTableViewCell

        
        cell.title.text = music.title
        cell.author.text = music.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentMusic : Music = self.musicList[(indexPath as NSIndexPath).row];
        self.launchMusicWithId(musicId: currentMusic.id)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
        }
    }
    

    func getMusics()->Void{
        dataHelper.musics(){
            (result: [Music]) in
            self.musicList = result
            self.refreshTableView()
        }
    }
    
    func refreshTableView(){
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    //------------------
    // Player Part
    //------------------
    
    @IBAction func playTouch(_ sender: AnyObject) {
        if (player != nil){
            player.play()
        }
    }
    
    @IBAction func pauseTouch(_ sender: AnyObject) {
        if (player != nil){
            player.pause()
        }
    }
    
    @IBAction func stopTouch(_ sender: AnyObject) {
        if (player != nil){
            player.stop()
            player.currentTime = 0.0
        }
    }
    
    @IBAction func rewindTouch(_ sender: AnyObject) {
        
        if(player != nil ){
            let previousId : Int = tableView.indexPathForSelectedRow!.row - 1

            //Lance la musique precedante
            if(self.musicList.count > 0 && previousId >= 0){
                let indexPath : IndexPath = IndexPath(item: previousId, section: 0)
                self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.top)
                
                let previousMusic : Music = self.musicList[previousId]
                self.launchMusicWithId(musicId: previousMusic.id)
            }
            else{
                displayMessage(title: "", message: "Vous avez atteint la premiere piste")
            }
        }

    }
    
    @IBAction func forwadTouch(_ sender: AnyObject) {
        
        if(player != nil ){
            let nextId : Int = tableView.indexPathForSelectedRow!.row + 1
        
            //Lance la musique suivante
            if(self.musicList.count > 0 && nextId < self.musicList.count){
                let indexPath : IndexPath = IndexPath(item: nextId, section: 0)
                self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.top)
            
                let nextMusic : Music = self.musicList[nextId]
                self.launchMusicWithId(musicId: nextMusic.id)
            }
            else{
                displayMessage(title: "", message: "Vous avez atteint la derniere piste")
            }
        }
    }
    
    func downloadFileFromURL(_ url:URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (URL, response, error) -> Void in
            self.mPlayer(URL!)
        })
        
        downloadTask.resume()
        
    }

    func mPlayer(_ url:URL) {
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            
            print(error.localizedDescription)
        } catch {
            print("Echec au niveau de l'init de l'AVAudioPlayer")
        }
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
