//
//  ViewController.swift
//  AppTareas
//
//  Created by Miguel Eduardo  Valdez Tellez  on 28/07/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var homeworkTableView: UITableView!
    @IBOutlet weak var porhacerTextField: UILabel!
    @IBOutlet weak var hechasTextField: UILabel!
    @IBOutlet weak var TotalTextField: UILabel!
    @IBOutlet weak var viewCollection: UIView!
    @IBOutlet weak var totalHomeworksTextField: UILabel!
    @IBOutlet weak var porhcaerHomeworksTextField: UILabel!
    @IBOutlet weak var hechasHomeworksTextField: UILabel!
    @IBAction func newHome(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "cambio")
        (viewController as? AddHomework)?.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
        
    }

    private let manager = CoreDataManager.shared
    private var homeworks: [Homeworks] = []
    private var hechas: Int = 0
    private var porHacer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeworks = manager.fetchHomeowrks()
        homeworkTableView.register(UINib(nibName: "HomeworkTableViewCell",bundle: nil),
                                   forCellReuseIdentifier: "HomeworkTableViewCell")
        homeworkTableView.dataSource = self
        porHacer = homeworks.count
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadHomeWorks()
    }

    private func loadHomeWorks() {
        homeworks = manager.fetchHomeowrks()
        totalHomeworksTextField.text = String(homeworks.count)
        hechasHomeworksTextField.text = String(hechas)
        porHacer = homeworks.count
        porhcaerHomeworksTextField.text = String(porHacer - hechas)
        homeworkTableView.reloadData()
    }
}

protocol CambioPantalla {
    func cambio()
}


//Celda seleccionada
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeworkTableViewCell",
                                                 for: indexPath)
        
        (cell as? HomeworkTableViewCell)?.delegate = self
        (cell as? HomeworkTableViewCell)?.index = indexPath.item
        
        
        if let newCell = cell as? HomeworkTableViewCell {
            DispatchQueue.main.async {
                let tareas = self.homeworks[indexPath.row]
                if let titulo = tareas.titulo, let tipo = tareas.tipo, let fechaIni = tareas.fecha_creacion, let fechaFinal = tareas.fecha_final {
                    newCell.setupCell(title: titulo, type: tipo, dateini: fechaIni, dateFinal: fechaFinal, status: tareas.status)
                }
                
            }
        }
        return cell
    }
}

extension ViewController: CambioPantalla{
    func cambio() {
        homeworkTableView.reloadData()
    }
}

extension ViewController: cambioCelda{
    func cambioSwith(estaprendido: Bool, index: Int) {
        if estaprendido == false{
            hechas = hechas + 1
            hechasHomeworksTextField.text = String(hechas)
            porhcaerHomeworksTextField.text = String(homeworks.count - hechas)
        }else{
            hechas = hechas - 1
            hechasHomeworksTextField.text = String(hechas)
            porhcaerHomeworksTextField.text = String(homeworks.count - hechas)
        }
    }
}
