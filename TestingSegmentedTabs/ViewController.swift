//
//  ViewController.swift
//  TestingSegmentedTabs
//
//  Created by Sahbi H. Belgacem on 21.01.17.
//  Copyright © 2017 Sahbi H. Belgacem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabs: UISegmentedControl!
    
    private lazy var aViewController: AViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "viewA") as! AViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var bViewController: BViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "viewB") as! BViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    private lazy var cViewController: CViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "viewC") as! CViewController
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabs.selectedSegmentIndex = 0
        remove(asChildViewController: bViewController)
        remove(asChildViewController: cViewController)
        add(asChildViewController: aViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tabsValueChanged(_ sender: Any) {
        switch tabs.selectedSegmentIndex {
        case 0:
            print("info tabs chosen")
            remove(asChildViewController: bViewController)
            remove(asChildViewController: cViewController)
            add(asChildViewController: aViewController)
        case 1:
            print("comments tabs chosen")
            remove(asChildViewController: aViewController)
            remove(asChildViewController: cViewController)
            add(asChildViewController: bViewController)
        case 2:
            print("updates tabs chosen")
            remove(asChildViewController: aViewController)
            remove(asChildViewController: bViewController)
            add(asChildViewController: cViewController)
        default:
            break
        }
    }
    
    // MARK: - Helper Methods
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    


}

