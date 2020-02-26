//
//  ViewController.swift
//  TestMVVM
//
//  Created by Anatoly Ryavkin on 21.02.2020.
//  Copyright © 2020 AnatolyRyavkin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol ViewControllerIncreasing : UIViewController{
    var button: UIButton! { get }
    var label: UILabel! { get }
}

class ViewController: UIViewController, ViewControllerIncreasing {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var labelForSegment: UILabel!

    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!

    var modelView1: ModelView! = nil
    var modelView2: ModelView! = nil

    override func viewDidLoad(){
        super.viewDidLoad()
        self.modelView1 = ModelView(controlInput: self.button, labelInput: self.label)
        self.modelView2 = ModelView(controlInput: self.segment, labelInput: self.labelForSegment)
    }


}

