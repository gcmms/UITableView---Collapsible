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
    
    var arrayDimencional = [
        ExpandableNames(isExpanded: true, names: ["Amy", "Bill", "Zelda", "Gabriel"]),
        ExpandableNames(isExpanded: true, names: ["Carlos", "Carina", "Caliu", "Calopsita"]),
        ExpandableNames(isExpanded: true, names: ["Daniel", "Dadinho"]),
        ExpandableNames(isExpanded: true, names: ["Patrick", "Pato"]),

    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath(){
        print("Atneção reload animation of indexPath")
        
        var indexPathsToReload = [IndexPath]()
        
        for section in arrayDimencional.indices {
            for row in arrayDimencional[section].names.indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPathsToReload.append(indexPath)
            }
        }
        
        /*for index in arrayDimencional[0].indices{
            //print(index);
            let indexPath = IndexPath(row: index, section: 0)
            indexPathsToReload.append(indexPath)
        }*/
        
        //let indexPath = IndexPath(row: 0, section: 0)
        showIndexPaths = !showIndexPaths
        //let animationSyle = showIndexPaths ? UITableViewRowAnimation.left : .right
        tableView.reloadRows(at: indexPathsToReload, with: .left)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Criar botão lado direito da navigator
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Exibir IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        
        
        //define cor para a tela
        view.backgroundColor = UIColor.white
        //Define o titulo
        navigationItem.title =  "Contatos"
        //Define titulo Grande IOS < 10
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Fechar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
        //return button
        
        
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        //return label + button
        
     
        
        return button;
    }
    
    @objc func handleExpandClose(button: UIButton){
        
        let section = button.tag
        
        print("tentei expandir ou fechar ")
        var indexPaths = [IndexPath]()
        for row in arrayDimencional[section].names.indices {
            print(0, row)
            let indexPath = IndexPath(row: row, section:section)
            indexPaths.append(indexPath)
        }
        
        
        
        let isExpanded = arrayDimencional[section].isExpanded
        arrayDimencional[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Abrir" : "Fechar", for: .normal)
        
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
        
        //arrayDimencional[section].names.removeAll()
        //tableView.deleteRows(at: indexPaths, with: .fade)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 36
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayDimencional.count
    }
    
    
    //definir numeros de linhas da tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        //Para retornar o numero de linhas nescessarios para o Array
        //return nomesComC.count
        if !arrayDimencional[section].isExpanded {
            return 0
        }
        return arrayDimencional[section].names.count
    }
    
    //retornar as celulas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //pega valores da array
        //let name = self.names[indexPath.row]
        
        //let name = indexPath.section == 0 ? names[indexPath.row] : nomesComC[indexPath.row]
        
        let name = arrayDimencional[indexPath.section].names[indexPath.row]
        //Texto que terá nas celulas
        cell.textLabel?.text = name
        
        //cell.textLabel?.text = "\(name) Section:\(indexPath.section) Row:\(indexPath.row)"
        
        return cell
    }


}

