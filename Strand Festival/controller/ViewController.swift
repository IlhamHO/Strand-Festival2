//
//  ViewController.swift
//  Strand Festival
//
//  Created by AMINE on 2/4/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    let festivalNaam = ["Strand Festival dag1","Strand Festival dag2"]
    let festivalImage = ["Strand Festival dag1.jpg","Strand Festival dag2.jpg"]
    let festivalDatum = ["DATUM : Zaterdag 29 augustus 2019","DATUM : Zondag 30 augustus 2019"]
    let festivalPlaats = ["ADRESS :  Zeelijk, 2965 Nieuwpoort","ADRESS :  Zeelijk, 2965 Nieuwpoort"]
    let festivalOmschrijving = ["", ""]
    let festivalPrijs = ["PRIJS : Gratis", "PRIJS : Gratis"]
    let festivalContact = ["TEL : +32(0)23456789", "TEL : +32(0)23456789"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return festivalNaam.count
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        
        cell.lblfestivalNaam.text = festivalNaam[indexPath.row]
        cell.myfestivalImage.image = UIImage.init(named: festivalImage[indexPath.row])
        cell.lblfestivalDatum.text = festivalDatum[indexPath.row]
        cell.lblfestivalPlaats.text = festivalPlaats[indexPath.row]
        
        
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            
            let viewController = storyboard?.instantiateInitialViewController()
            //self.navigationController?.pushViewController(viewController!, animated: true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination: DetailViewController = segue.destination as! DetailViewController
        
        let plaatsWaarGeklikt = collectionView.indexPath(for: sender as! UICollectionViewCell)!
        
        var festival = Festival()
        festival.festivalNaam = festivalNaam[plaatsWaarGeklikt.row]
        festival.festivalImage = festivalImage[plaatsWaarGeklikt.row]
        festival.festivalDatum = festivalDatum[plaatsWaarGeklikt.row]
        festival.festivalOmschrijving = festivalOmschrijving[plaatsWaarGeklikt.row]
        festival.festivalPrijs = festivalPrijs[plaatsWaarGeklikt.row]
        festival.festivalContact = festivalContact[plaatsWaarGeklikt.row]
        
        destination.doorgegevenFestival = festival
        
        }
}

