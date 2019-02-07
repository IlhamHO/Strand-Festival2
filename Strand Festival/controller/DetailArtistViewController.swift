//
//  DetailArtistViewController.swift
//  Strand Festival
//
//  Created by AMINE on 2/5/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import UIKit

class DetailArtistViewController: UIViewController {
    
    
    var doorgegevenArtist:Artist?
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    
    @IBOutlet weak var lblArtistName: UILabel!
    
    
    @IBOutlet weak var lblArtistDate: UILabel!
    
    
    @IBOutlet weak var lblArtistHour: UILabel!
    
    
    
    @IBOutlet weak var lblArtistStyle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageLabel.image = UIImage.init(named: "doorgegevenArtist?.artistImage")
        lblArtistName.text = doorgegevenArtist?.artistName
        lblArtistDate.text = doorgegevenArtist?.artistDate
        lblArtistHour.text = doorgegevenArtist?.artistHour
        lblArtistStyle.text = doorgegevenArtist?.artistStyle
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
