//
//  MultimediaDataHelper.swift
//  iMusic
//
//  Created by Akiro on 28/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import UIKit
import Foundation

class MultimediaDataHelper: NSObject {
    
    static let sharedInstance = MultimediaDataHelper()
    let urlPathMusic :String = "http://localhost:8080/api/musics/"
    let urlPathVideo :String = "http://localhost:8080/api/videos/"

    override init() {
       
    }
        
    
    func musics(_ completion: @escaping (_ result: [Music]) -> Void){
        var musics : [Music] = []
        
        let url: URL = URL(string: urlPathMusic)!
        let session = URLSession.shared
        let task = session.dataTask(
            with: url,
            completionHandler: {
                data, response, error -> Void in
                
                if error != nil {
                    // Erreur dans la requete : Affiche directement dans la console
                    print(error!.localizedDescription)
                }
                
                do{
                    let jsonResult = try JSONSerialization.jsonObject(with: data!,  options: .allowFragments) as! NSArray
                    
                    musics = self.musicParser(jsonResult)
                    completion(musics)
                }
                catch{
                    print("Erreur lors de la récuperation des musiques")
                }
            }
        )
        task.resume()
    }
    
    
    func videos(_ completion: @escaping (_ result: [Video]) -> Void){
        var videos : [Video] = []
        
        let url: URL = URL(string: urlPathVideo)!
        let session = URLSession.shared
        let task = session.dataTask(
            with: url,
            completionHandler: {
                data, response, error -> Void in
                
                if error != nil {
                    // Erreur dans la requete : Affiche directement dans la console
                    print(error!.localizedDescription)
                }
                
                do{
                    let jsonResult = try JSONSerialization.jsonObject(with: data!,  options: .allowFragments) as! NSArray
                    
                    videos = self.videoParser(jsonResult)
                    completion(videos)
                }
                catch{
                    print("Erreur lors de la récuperation des musiques")
                }
            }
        )
        task.resume()
    }
    
    
    func musicParser(_ json : NSArray) -> [Music]{
        var musics : [Music] = []
        for object in json{
            let title = (object as AnyObject).object(forKey: "title") as! String
            let author = (object as AnyObject).object(forKey: "author") as! String
            let id = (object as AnyObject).object(forKey: "_id") as! String
            musics.append(
                Music(id : id, title : title, author : author)
            );
        }
        
        return musics;
    }
    
    func videoParser(_ json : NSArray) -> [Video]{
        var videos : [Video] = []
        for object in json{
            let title = (object as AnyObject).object(forKey: "title") as! String
            let author = (object as AnyObject).object(forKey: "author") as! String
            let id = (object as AnyObject).object(forKey: "_id") as! String
            videos.append(
                Video(id : id, title : title, author : author)
            );
        }
        
        return videos;
    }
    
    
}
