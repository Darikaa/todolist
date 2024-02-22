//
//  ViewController.swift
//  ToDoList
//
//  Created by Darika Ostemirkyzy on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textfield.text!
        var newTask = TaskItem()
        newTask.name = taskName
        
        
        do {
            if let data = defaults.data(forKey: "taskItemArray"){
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "taskItemArray")
            } else{
                let encodedata = try JSONEncoder().encode([newTask])
                
                defaults.set(encodedata, forKey: "taskItemArray")
            }
        }
        catch{
            print("unable to encode\(error)")
        }
        
//        if let array = defaults.array(forKey: "taskItemArray"){
//            taskarray = array as! [TaskItem]
//            
//            taskarray.append(newTask)
//            
//            defaults.set(taskarray, forKey: "taskItemArray")
//        } else {
//            let array = [newTask]
//            
//        }
        textfield.text = ""
        
    }
}
