//
//  ViewController.swift
//  UITableView
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/07/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId123456"
    
    //Array de nomes
    let names = [
        "Amy", "Bill", "Zelda", "Gabriel"
    ]
    
    let nomesComC = [
        "Carlos", "Carina", "Caliu", "Calopsita"
    ]
    
    let arrayDimencional = [
        ["Amy", "Bill", "Zelda", "Gabriel"],
        ["Carlos", "Carina", "Caliu", "Calopsita"],
        ["Daniel", "Dadinho"],
        ["Patrick", "Pato"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //define cor para a tela
        view.backgroundColor = UIColor.white
        //Define o titulo
        navigationItem.title =  "Contatos"
        //Define titulo Grande IOS < 10
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayDimencional.count
    }
    
    
    //definir numeros de linhas da tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        //Para retornar o numero de linhas nescessarios para o Array
        //return nomesComC.count
        return arrayDimencional[section].count
    }
    
    //retornar as celulas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //pega valores da array
        //let name = self.names[indexPath.row]
        
        //let name = indexPath.section == 0 ? names[indexPath.row] : nomesComC[indexPath.row]
        
        let name = arrayDimencional[indexPath.section][indexPath.row]
        //Texto que terá nas celulas
        cell.textLabel?.text = name
        
        cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row:\(indexPath.row)"
        
        return cell
    }


}

