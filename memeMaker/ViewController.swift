//
//  ViewController.swift
//  memeMaker
//
//  Created by Nayeon Kim on 2021/01/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    let topChoices = [
        captionOption(emoji: "🐾", caption: "put your paws up!")
        , captionOption(emoji: "🏃", caption: "run run run!")
        , captionOption(emoji: "🛏", caption: "tired and sleepy😴")
        , captionOption(emoji: "🤯", caption: "anger makes their jaw drop!")
    ]
        
    let bottomChoices = [
        captionOption(emoji: "🐶", caption: "WOOF!")
        , captionOption(emoji: "🐱", caption: "MEOW!")
    ]
    
    let imageMongja = ["mongja_feet", "mongja_run", "mongja_sleepy", "mongja_angry"]
    let imageJjdd = ["jjondduck_feet", "jjondduck_run", "jjondduck_sleepy", "jjondduck_angry"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for bottomChoice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: bottomChoice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        updateLabels()
        updateImage()
    }
    
    
    @IBAction func changeInControls(_ sender: Any) {
        updateLabels()
        updateImage()
    }
    
    func updateLabels() {
        let topSelectedIndex =
            topSegmentedControl.selectedSegmentIndex
        let bottomSelectedIndex =
            bottomSegmentedControl.selectedSegmentIndex
        
        topLabel.text = topChoices[topSelectedIndex].caption
        bottomLabel.text = bottomChoices[bottomSelectedIndex].caption
    }
    
    func updateImage() {
        let imageName:String
        switch bottomSegmentedControl.selectedSegmentIndex {
        case 0:
            imageName = imageMongja[topSegmentedControl.selectedSegmentIndex]
            break
        default:
            imageName = imageJjdd[topSegmentedControl.selectedSegmentIndex]
            break
        }
        
        imageView.image = UIImage(named: imageName)
    }
    
    

}

