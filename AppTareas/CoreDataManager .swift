//
//  CoreDataManager .swift
//  AppTareas
//
//  Created by Miguel Eduardo  Valdez Tellez  on 29/07/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import Foundation
//1.- Importamos el framework de Core Data para acceder a su API
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    //2.- Creamos una propiedad llamada container de tipo NSPersistentContainer que utilizaremos en los diferentes métodos de la clase.
    private let container : NSPersistentContainer!
    
    //3.- Asignamos un objeto NSPersistentContainer
    init()
    {
        container = NSPersistentContainer(name: "Model")
        setupDatabase()
    }
    
    
  private func setupDatabase() {
        //4.- El método loadPersistentStores se encarga de inicializar y completar el Core Data Stack
        container.loadPersistentStores { (desc, error) in
        if let error = error {
            print("Error loading store \(desc) -\(error)")
            return
        }
        print("conexion exitosa")
            
    }
}

    
    //Crear y guardar registros
    //1. Crear nueva funcion con los parametros que se usaran
    func createHomework(titulo : String, tipo : String, status : Bool, fecha_creacion : String, fecha_final : String, completion: @escaping() -> Void)
    {
        //Crear container
        let context = container.viewContext
        
        //crear objeto homework asignando los parametros
        let homework = Homeworks(context: context)
        homework.titulo = titulo
        homework.tipo = tipo
        homework.status = status
        homework.fecha_creacion = fecha_creacion
        homework.fecha_final = fecha_final
        
        //save
        do{
            try context.save()
            print("Tarea \(titulo) guardado")
            completion()
        }catch{
            print("Error guardado tarea \(titulo)")
        }
        
    }

    
    
    //Obtener registros dentro de la base
   func fetchHomeowrks() -> [Homeworks] {
        //1.- Obtenemos un objeto NSFetchRequest
        let fetchRequest : NSFetchRequest<Homeworks> = Homeworks.fetchRequest()
        do {
      
            //2.- Invocamos el método fetch del viewContext del contenedor para obtener un arreglo de usuarios,
            let result = try container.viewContext.fetch(fetchRequest)
            return result
            }
                catch
        {
            print("El error obteniendo tarea(s) \(error)")
         }
     
          //3
         return []
    }
    
    
    //Actualizar status
    func updateStatus(status: Bool)
    {
       
    }

}
