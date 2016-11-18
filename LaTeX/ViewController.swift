//
//  ViewController.swift
//  LaTeX
//
//  Created by Keke Arif on 18/11/2016.
//  Copyright © 2016 Keke Arif. All rights reserved.
//

import UIKit
import iosMath


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    let latexView = MTMathUILabel()
    let margin: CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLatexLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupLatexLabel() {
        textField.text = "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}"
        latexView.latex = textField.text
        latexView.frame = CGRect(x: margin
            , y: 100, width: 0, height: 0)
        latexView.fontSize = 15
        latexView.textAlignment = .center
        latexView.paddingTop = 10
        latexView.paddingBottom = 10
        latexView.paddingLeft = 10
        latexView.paddingRight = 10
        latexView.sizeToFit()
        latexView.layer.cornerRadius = 3.0
        latexView.layer.borderColor = UIColor.lightGray.cgColor
        latexView.layer.borderWidth = 0.5
        latexView.displayErrorInline = false
        view.addSubview(latexView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Convert text here
        latexView.latex = textField.text
        latexView.sizeToFit()
        return true
    }

    @IBAction func valueChanged(_ sender: UISlider) {
        latexView.fontSize = CGFloat(sender.value)
        latexView.sizeToFit()
    }

}

