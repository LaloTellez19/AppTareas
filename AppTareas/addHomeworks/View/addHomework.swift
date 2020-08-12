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

class AddHomework: UIViewController, addHomeworksViewProtocol{
    var presenter: addHomeworksPresenterProtocol?
    var typeSelecionado = ""
    var delegate: CambioPantalla!
    private let manager = CoreDataManager.shared
    private let types = Types.allCases
    @IBOutlet weak var titleNewHomeworkTextField: UITextField!
    @IBOutlet weak var typeNewHomeworkPicker: UIPickerView!
    @IBAction func addhomework(_ sender: Any)
    {
        if let text = titleNewHomeworkTextField.text, text.isEmpty
        {
            let alert = UIAlertController(title: "Campo Vacio", message: "Ingrese el nombre de la tarea", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else
        {
            let date = Date()
            let fechaFinal = ""
            let dateFormetter = DateFormatter()
            dateFormetter.dateStyle = .medium
            let dateiniAdd = dateFormetter.string(from: date)
            let titleAdd: String = titleNewHomeworkTextField.text!
            let typeAdd:String = typeSelecionado
            presenter?.addNewHomework(titulo: titleAdd, Tipo: typeAdd, status: true, fechaIni: dateiniAdd, FechaFina: fechaFinal)
            presenter?.returnHome()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeNewHomeworkPicker.dataSource = self
        typeNewHomeworkPicker.delegate = self
        initizalaHideKeyboad()
    }
}

//teclado
extension AddHomework{
    func initizalaHideKeyboad()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

//enum de picker
extension AddHomework: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        typeSelecionado = types[row].rawValue
        
    }
}

extension AddHomework: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row].rawValue
    }
}

