//
//  ArtistViewController.swift
//  Strand Festival
//
//  Created by AMINE on 2/4/19.
//  Copyright © 2019 be.ehb. All rights reserved.
//


import UIKit



class ArtistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
  
    var artists = [Artist(artistName:"Jason Derullo",artistImage:"artistEen",artistDate:"Zondag 30 augustus 2019",artistHour:"Om 20 uur",artistStyle:"Music Style"),
                   Artist(artistName:"Bastille",artistImage:"artistTwee",artistDate:"Zaterdag 29 augustus 2019",artistHour:"Om 17 uur",artistStyle:"Music Style"),
                   Artist(artistName:"Dimistri Vegas & Like Mike",artistImage:"artistDree",artistDate:"Zaterdag 29 augustus 2019 ",artistHour:"Om 22 uur",artistStyle:"Music Style"),
                   Artist(artistName:"Anne- Marie",artistImage:"artistVier",artistDate:"Zaterdag 29 augustus 2019",artistHour:"Om 17 uur",artistStyle:"Music Style"),
                   Artist(artistName:"Jonas Blue",artistImage:"artistFive",artistDate:"Zondag 30 augustus 2019",artistHour:"Om 18 uur",artistStyle:"Music Style"),
                   Artist(artistName:"John Newman",artistImage:"artistZes",artistDate:"Zondag 30 augustus 2019",artistHour:"Om 19 uur",artistStyle:"Music Style"),
                   Artist(artistName:"Necc Party",artistImage:"artistZeven",artistDate:"Zaterdag 29 augustus 2019",artistHour:"Om 15 uur",artistStyle:"Music Style"),
                   Artist(artistName:"AK26",artistImage:"artistAcht",artistDate:"Zaterdag 29 augustus 2019",artistHour:"Om 16 uur",artistStyle:" Music Style")]
    
    var myindex = 0
    
    var filteredArtists = [Artist]()
    
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        filteredArtists = artists
        
        
        
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        //definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        
        
    }
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        // If we haven't typed anything into the search bar then do not filter the results
        
        if searchController.searchBar.text! == "" {
            
            filteredArtists = artists
            
        } else {
            
            // Filter the results
            
            filteredArtists = artists.filter { $0.artistName.lowercased().contains(searchController.searchBar.text!.lowercased()) }
            
        }
        
        
        
        self.tableView.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filteredArtists.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier : "cell")
        
        
        cell.textLabel?.text = self.filteredArtists[indexPath.row].artistName;
        cell.detailTextLabel?.text = self.filteredArtists[indexPath.row].artistDate;

        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination:DetailArtistViewController = segue.destination as! DetailArtistViewController
        //wat naar het scherm
    
        let plaatsWaarGeklikt = tableView.indexPathForSelectedRow
        let artist =  plaatsWaarGeklikt!.row
        //effectief doorgeven
       //TODO
        destination.doorgegevenArtist = artists[artist]
    }
    
}


   
