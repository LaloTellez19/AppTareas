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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String, type: String, dateini: String, dateFinal: String, status: Bool)
    {
        tituloCellTextFeld.text = title
        tipoCellTextField.text = type
        fechafinalTextField.text = dateini
        fechaCreacionTextField.text = dateFinal
    }
    
}
