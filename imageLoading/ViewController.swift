//
//  ViewController.swift
//  imageLoading
//
//  Created by seoha on 2023/03/01.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var viewCon1: UIView!
    
    @IBOutlet weak var loadImage1: UIImageView!
    @IBOutlet weak var loadImage2: UIImageView!
    @IBOutlet weak var loadImage3: UIImageView!
    @IBOutlet weak var loadImage4: UIImageView!
    
    @IBOutlet weak var buttonTapped1: UIButton!
    @IBOutlet weak var buttonTapped2: UIButton!
    @IBOutlet weak var buttonTapped3: UIButton!
    @IBOutlet weak var buttonTapped4: UIButton!
    
    
    @IBOutlet weak var loadAllImages: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    
    func imageDownLoad(urlString: String, completion: @escaping ( UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code")
                completion(nil)
                return
            }
            
            guard let imageData = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            let image = UIImage(data: imageData)!

            completion(image)
            
        }
        
        task.resume()
    }
    
    
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        imageDownLoad(urlString: "https://img1.kakaocdn.net/thumb/R142x142@2x.q82.fwebp/?fname=https%3A%2F%2Ft1.kakaocdn.net%2Ffriends%2Fprod%2Fproduct%2F20230227094843943_8809922500245_AW_00.jpg") { image in
            
            DispatchQueue.main.async {
                self.loadImage1.image = image
            }
        }
    }
    
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        imageDownLoad(urlString: "https://img1.kakaocdn.net/thumb/R142x142@2x.q82.fwebp/?fname=https%3A%2F%2Ft1.kakaocdn.net%2Ffriends%2Fprod%2Fproduct%2F20230227095743601_8809922500238_AW_00.jpg") { image in
            
            DispatchQueue.main.async {
                self.loadImage2.image = image
            }
        }
    }
    
    
   
    @IBAction func button3Tapped(_ sender: UIButton) {
        imageDownLoad(urlString: "https://img1.kakaocdn.net/thumb/R142x142@2x.q82.fwebp/?fname=https%3A%2F%2Ft1.kakaocdn.net%2Ffriends%2Fprod%2Fproduct%2F20230222155550067_8809922500269_AW_00.jpg") { image in
            
            DispatchQueue.main.async {
                self.loadImage3.image = image
            }
        }
    }
    
    
    @IBAction func button4Tapped(_ sender: UIButton) {
        imageDownLoad(urlString: "https://img1.kakaocdn.net/thumb/R142x142@2x.q82.fwebp/?fname=https%3A%2F%2Ft1.kakaocdn.net%2Ffriends%2Fprod%2Fproduct%2F20230227092414835_8809922500252_AW_00.jpg") { image in
            
            DispatchQueue.main.async {
                self.loadImage4.image = image
            }
        }
    }
    
    
    
    @IBAction func allButtonTapped(_ sender: UIButton) {
        button1Tapped(buttonTapped1)
        button2Tapped(buttonTapped2)
        button3Tapped(buttonTapped3)
        button4Tapped(buttonTapped4)
    }
    
    
       
        
}
  


