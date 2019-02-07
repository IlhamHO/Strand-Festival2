//
//  DetailViewController.swift
//  Strand Festival
//
//  Created by AMINE on 2/4/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var doorgegevenFestival:Festival?
    
    @IBOutlet weak var myfestivalImage: UIImageView!
    
    @IBOutlet weak var lblfestivalNaam: UILabel!
    
    @IBOutlet weak var lblfestivalDatum: UILabel!
    
    @IBOutlet weak var lblfestivalPlaats: UILabel!
    
    
    @IBOutlet weak var tvfestivalOmschrijving: UITextView!
    
    
    @IBOutlet weak var lblfestivalPrijs: UILabel!
    
    @IBOutlet weak var lblfestivalContact: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        myfestivalImage.image = UIImage.init(named: (doorgegevenFestival?.festivalImage)!)
        lblfestivalNaam.text = doorgegevenFestival?.festivalNaam
        lblfestivalDatum.text = doorgegevenFestival?.festivalDatum
        lblfestivalPlaats.text = doorgegevenFestival?.festivalPlaats
        lblfestivalPrijs.text = doorgegevenFestival?.festivalPrijs
        lblfestivalContact.text = doorgegevenFestival?.festivalContact
      
        // Do any additional setup after loading the view.
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
