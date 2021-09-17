//
//  ViewController.swift
//  Caculator
//
//  Created by datNguyem on 16/09/2021.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var numPad: [UIButton]!
    @IBOutlet private var opearators: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        numPad.forEach { $0.currentTitle == "0" ? $0.makeRounded() :$0.makeCircle() }
        opearators.forEach { $0.makeCircle() }
    }
}

