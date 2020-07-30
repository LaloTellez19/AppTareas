//
//  HomeworkTableViewCell.swift
//  AppTareas
//
//  Created by Miguel Eduardo  Valdez Tellez  on 29/07/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit

class HomeworkTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloCellTextFeld: UILabel!
    @IBOutlet weak var tipoCellTextField: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var fechafinalTextField: UILabel!
    @IBOutlet weak var fechaCreacionTextField: UILabel!
    
    @IBAction func switchStatus(_ sender: UISwitch) {
        delegate.cambioSwith(estaprendido: sender.isOn, index: index)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var delegate: cambioCelda!
    var index: Int!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String, type: String, dateini: String, dateFinal: String, status: Bool)
    {
        tituloCellTextFeld.text = title
        tipoCellTextField.text = type
        fechaCreacionTextField.text = dateini
        fechafinalTextField.text = dateFinal
        //statusSwitch.isOn = status
    }
}

protocol  cambioCelda{
func cambioSwith(estaprendido: Bool, index: Int)
}
