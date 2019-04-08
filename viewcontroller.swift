//
//  ViewController.swift
//  Randog
//
//  Created by MANISH MOTGHARE on 08/04/19.
//  Copyright © 2019 CodersRoost. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint){(data, response, error) in
            guard let data = data else{
                return
            }
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            print(imageData)
            
            let image = imageData.message
            guard let imageUrl = URL(string: image) else{
                print("cannot create url")
                return
            }
        let task1 = URLSession.shared.dataTask(with: imageUrl){(data, response, error) in
                guard let data = data else{
                    print("no data, or there was an error")
                    return
                }
                let downloadedImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            
           /* print(data)
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let url = json["message"] as! String
                print(url)
                }catch{
                    print(error)
                }*/
        }
            task1.resume()
       
    }
 task.resume()

}

}
