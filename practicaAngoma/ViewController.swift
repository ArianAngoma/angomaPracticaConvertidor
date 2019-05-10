//
//  ViewController.swift
//  practicaAngoma
//
//  Created by Arian Angoma on 10/05/19.
//  Copyright © 2019 angoma.pe.edu.tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var unidades : [Unidad] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unidades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let unidad = unidades[indexPath.row]
        cell.textLabel?.text = "\( unidad.datoFinal )"
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            unidades = try context.fetch(Unidad.fetchRequest())
            tableView.reloadData()
        }catch{}
    }
}

