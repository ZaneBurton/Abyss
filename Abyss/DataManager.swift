//
//  DataManager.swift
//  Abyss
//
//  Created by Zane Burton on 3/18/19.
//  Copyright © 2019 Zane Burton. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    let MYJSONURL = "https://api.myjson.com/bins/1e5uji"
    var dataModel: MovieDataModel?
    

    
    func getData(completion: @escaping (_ dataModel: MovieDataModel) -> ()) {
        
        // let urlString = "https://api.myjson.com/bins/cgiym"
        let actualURL = URL(string: MYJSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: actualURL!) {(data, response, error) in
            
            guard let data = data else {
                return
            }
            
            print(data.description)
            
            do {
                let decoder = JSONDecoder()
                let mediaData = try decoder.decode(MovieDataModel.self, from: data)
                
                self.dataModel = mediaData
                
//                print(self.dataModel)
                
            } catch {
                print("We have error")
            }
            
            DispatchQueue.main.async {
                completion(self.dataModel!)
            }
            
        }
        dataTask.resume()
        //let session = URLSession.shared
        
        /*
        let task = session.dataTask(with: actualURL!) { (data, response, error) in
            
            if let _ = data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let veggieArray = jsonObj!.value(forKey: "entries") as? Array<String> {
                        self.dataArray = veggieArray
                        
                        
                    }
                    print(jsonObj!.value(forKey: "entries")!)
                }
            } else {
                success = false
            }
            completion(success)
        }*/
        //task.resume()
        
    }
    
}
