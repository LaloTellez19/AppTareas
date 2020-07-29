//
//  AddHomework.swift
//  AppTareas
//
//  Created by Miguel Eduardo  Valdez Tellez  on 29/07/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit

enum Types: String, CaseIterable {
    case work = "Tarea"
    case school = "Escuela"
    case personal = "Personal"
}

class AddHomework: UIViewController {

    @IBOutlet weak var titleNewHomeworkTextField: UITextField!
    @IBOutlet weak var addNewHomeworkButton: UIButton!
    @IBOutlet weak var typeNewHomeworkPicker: UIPickerView!
    
    private let types = Types.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeNewHomeworkPicker.dataSource = self
        typeNewHomeworkPicker.delegate = self
    }
    
}

extension AddHomework: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
}

extension AddHomework: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row].rawValue
    }
}
