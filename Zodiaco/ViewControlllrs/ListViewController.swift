//
//  ViewController.swift
//  Zodiaco
//
//  Created by Tardes on 14/1/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var horoscopeList = Horoscope.horoscopeList

    
    
    
    // Filtro actual (puede ser nil si se muestran todos)
    var currentElementFilter: HoroscopeElement?

    // Guardar texto de búsqueda actual
    var currentSearchText: String = ""

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        // Barra de búsqueda
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        // Botón de filtro en la barra de navegación
        let filterButton = UIBarButtonItem(title: "Filtrar", style: .plain, target: self, action: #selector(showFilterOptions))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    
    // racargar el valor antes de entrar a la tabla 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    // MARK: - Filtro por elemento
    
    @objc func showFilterOptions() {
        let alert = UIAlertController(title: "Filtrar por elemento", message: nil, preferredStyle: .actionSheet)
        
        // Acción para mostrar todos
        alert.addAction(UIAlertAction(title: "Todos", style: .default) { [weak self] _ in
            self?.currentElementFilter = nil
            self?.applyFilters()
            
        })
        
        // Acciones para cada elemento
        for element in [HoroscopeElement.fuego, .tierra, .aire, .agua] {
            alert.addAction(UIAlertAction(title: element.rawValue, style: .default) { [weak self] _ in
                self?.currentElementFilter = element
                self?.applyFilters()
            })
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        // Para iPad, debes especificar el anchor del popover
        if let popover = alert.popoverPresentationController {
            popover.barButtonItem = navigationItem.rightBarButtonItem
        }
        present(alert, animated: true)
    }
    
    
    
    // Aplica filtro de elemento (y de texto)
    func applyFilters(searchText: String? = nil) {
        // Usa el texto proporcionado o el último texto guardado
        let text = searchText ?? currentSearchText
        currentSearchText = text
        
        var filtered = Horoscope.horoscopeList

        // Primero filtro por elemento si es necesario
        if let element = currentElementFilter {
            filtered = filtered.filter { $0.element == element }
        }
        // Después, filtro por texto si hay texto de búsqueda
        if !text.isEmpty {
            filtered = filtered.filter {
                $0.name.localizedCaseInsensitiveContains(text) ||
                $0.dates.localizedCaseInsensitiveContains(text)
            }
        }
        horoscopeList = filtered
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Horoscope Cell", for: indexPath) as! HoroscopeViewCell
        let horoscope = horoscopeList[indexPath.row]
        cell.configure(with: horoscope)
        return cell
    }
    
    // MARK: - SearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        applyFilters(searchText: searchText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let horoscope = horoscopeList[indexPath.row]
        detailViewController.horoscope = horoscope
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
