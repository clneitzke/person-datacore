//
//  ViewController.swift
//  person-datacore
//
//  Created by Cleber Neitzke on 02/03/21.
//

import UIKit

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var items:[Person]?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#ffbd69")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // IMPORTANT Codegen - Category/Extension
        // Cria objeto usando o context
        
        let cleber = Person(context: self.context)
        cleber.name = "Cleber"
        cleber.age = 42
        cleber.gender = "M"

        let jana = Person(context: self.context)
        jana.name = "Juanita"
        jana.age = 43
        jana.gender = "F"

        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 440)

        // Salva dados
        do {
            try context.save()
        } catch  {
            
        }
        
        // List on output
        fecthPeople()
        
    }

    // Get list of people
    func fecthPeople() {

        do {
            // from Person Class
            self.items = try context.fetch(Person.fetchRequest())
         
            if let items = items {
                for item in items {
                    print(item.name!)
                }
            }
            
            print(".. ok")
            // TODO: - reload tableView
            
        } catch {
            print(".. error")
        }
        
    }
}


