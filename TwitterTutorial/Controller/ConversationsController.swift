//
//  ConversationsController.swift
//  TwitterTutorial
//
//  Created by billy.cychan on 5/8/2021.
//

import UIKit

class ConversationsController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }

}
