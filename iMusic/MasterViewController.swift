//
//  ViewController.swift
//  iMusic
//
//  Created by Akiro on 28/11/2016.
//  Copyright © 2016 Esgi. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet var childViewControllersView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func updateView() {
        self.musicViewController.view.isHidden = !(self.segmentedControl.selectedSegmentIndex == 0)
        self.videoViewController.view.isHidden = !(self.segmentedControl.selectedSegmentIndex == 1)
        
//        if segmentedControl.selectedSegmentIndex == 0 {
//            remove(asChildViewController: musicViewController)
//            add(asChildViewController: musicViewController)
//        } else {
//            remove(asChildViewController: videoViewController)
//            add(asChildViewController: videoViewController)
//        }
    }
    
    
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Music", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Video", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }

    func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }

    
    
    
    private lazy var musicViewController: MusicViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "MusicViewController") as! MusicViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var videoViewController: VideoViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "VideoViewController") as! VideoViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()

    
    
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


