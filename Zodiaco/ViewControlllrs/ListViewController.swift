//
//  ViewController.swift
//  Zodiaco
//
//  Created by Tardes on 14/1/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    //
    //                                                                  icluir esta variable
    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList = Horoscope.horoscopeList

    
    // MARK: Propiedades
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        // barra de busqueda
        
        //TODO: a realizar una fucnion pero la hare mas tarde
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
    }
    
    
    // MARK:
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.configure(with: horoscope)
        return cell
    }
    
    
    
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //  print(searchText)
        /*
         horoscopeList = Horoscope.horoscopeList.filter{ $0.name.localizedStandardContains(searchText) }
         tableView.reloadData()
         
         */
        
        if searchText.isEmpty {
            horoscopeList = Horoscope.horoscopeList
        }
        else {
            
            
            horoscopeList = Horoscope.horoscopeList.filter{ horoscope in horoscope.name.localizedCaseInsensitiveContains(searchText) || horoscope.dates.localizedCaseInsensitiveContains(searchText)
            }
            tableView.reloadData()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let detailViewController = segue.destination as! DetailViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let horoscope = horoscopeList[indexPath.row]
        detailViewController.horoscope = horoscope
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}


