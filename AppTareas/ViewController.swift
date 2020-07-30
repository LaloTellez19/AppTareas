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
    
    @IBOutlet weak var PorhacerTextField: UILabel!
    @IBOutlet weak var HechasTextField: UILabel!
    @IBOutlet weak var TotalTextField: UILabel!
    @IBOutlet weak var viewCollection: UIView!
    @IBOutlet weak var totalHomeworksTextField: UILabel!
    
    @IBOutlet weak var porhcaerHomeworksTextField: UILabel!
    @IBOutlet weak var hechasHomeworksTextField: UILabel!
    
    private let manager = CoreDataManager.shared
    private var homeworks: [Homeworks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeworkTableView.register(UINib(nibName: "HomeworkTableViewCell",bundle: nil),
                                   forCellReuseIdentifier: "HomeworkTableViewCell")
        homeworkTableView.dataSource = self
        totalHomeworksTextField.text = String(homeworks.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadHomeWorks()
    }

    private func loadHomeWorks() {
        homeworks = manager.fetchHomeowrks()
        homeworkTableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeworkTableViewCell",
                                                 for: indexPath)
        if let newCell = cell as? HomeworkTableViewCell {
            DispatchQueue.main.async {
                newCell.setupCell(title: "Tarea 1", type: "Trabajo", dateini: "29-07-2020", dateFinal: "30-07-2020", status: false)
            }
        }
        return cell
    }
}

