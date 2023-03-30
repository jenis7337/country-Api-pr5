//
//  ViewController2.swift
//  country Api pr5
//
//  Created by Jenish Navadiya on 29/03/23.
//

import UIKit

class ViewController2: UIViewController {

  
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l2: UILabel!

    @IBOutlet weak var img2: UIImageView!
    
    var a = String()
    var b = UIImage()
    var c = Int()
    var d = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        l2.text = a
        img.image = b
        l3.text = "\(c)"
        img2.image = d
        
      
    }
}
