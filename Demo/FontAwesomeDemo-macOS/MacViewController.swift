//
//  ViewController.swift
//  FontAwesomeDemo-macOS
//
//  Created by Oliver Ziegler on 19/10/2016.
//
//

import Cocoa
import FontAwesome_macOS

class MacViewController: NSViewController {

    
    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var coloredImageView: NSImageView!
    @IBOutlet weak var imageButton: NSButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FontAwesome icon in label/textfield
        label.font = NSFont.fontAwesomeOfSize(50)
        label.stringValue = String.fontAwesomeIconWithName(.Github)
        
        // FontAwesome icon in button
        imageButton.font = NSFont.fontAwesomeOfSize(30)
        imageButton.title = String.fontAwesomeIconWithName(.Github)

        // FontAwesome icon as image
        imageView.image = NSImage.fontAwesomeIconWithName(.Github, textColor: .black, size: CGSize(width: 500, height: 500))
        
        // FontAwesome icon as image with background color
        coloredImageView.image = NSImage.fontAwesomeIconWithName(FontAwesome.Github, textColor: .blue, size: CGSize(width: 4000, height: 4000), backgroundColor: .red)
    }
}

