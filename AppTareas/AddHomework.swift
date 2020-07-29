//
//  AddHomework.swift
//  AppTareas
//
//  Created by Miguel Eduardo  Valdez Tellez  on 29/07/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit

class AddHomework: UIViewController {

    @IBOutlet weak var titleNewHomeworkTextField: UITextField!
    @IBOutlet weak var addNewHomeworkButton: UIButton!
    @IBOutlet weak var typeNewHomeworkPicker: UIPickerView!
    
    enum Types: String, CaseIterable{
          case work = "Tarea"
          case school = "Escuela"
          case personal = "Personal"
      }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return Types.allCases.count
        }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return Types.allCases[row].rawValue
        }

}
