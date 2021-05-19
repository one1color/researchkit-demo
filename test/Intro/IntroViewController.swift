//
//  IntroViewController.swift
//  test
//
//  Created by koki isshiki on 11.05.21.
//
import UIKit

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        toConsent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toConsent(){
        performSegue(withIdentifier: "toConsent", sender: self)
    }
    
    func toTasks(){
        performSegue(withIdentifier: "toTasks", sender: self)
    }
}
