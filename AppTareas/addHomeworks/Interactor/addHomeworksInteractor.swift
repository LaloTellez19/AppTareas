//
//  addHomeworksInteractor.swift
//  AppTareas
//
//  Created by Miguel Eduardo Valdez Tellez on 08/11/2020.
//  Copyright © 2020 Linko. All rights reserved.
//

import Foundation

class addHomeworksInteractor: addHomeworksInteractorInputProtocol {
    private let manager = CoreDataManager.shared
    func addNewHomework(titulo: String, Tipo: String, status: Bool, fechaIni: String, FechaFina: String) {
        manager.createHomework(titulo: titulo, tipo: Tipo, status: status, fecha_creacion: fechaIni, fecha_final: FechaFina) {}
    }
    
    weak var presenter: addHomeworksInteractorOutputProtocol?
    
    init() {}
}
