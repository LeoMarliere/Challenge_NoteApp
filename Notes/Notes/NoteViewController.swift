//
//  NoteViewController.swift
//  Notes
//
//  Created by Léo MARLIERE on 30/03/2022.
//

import Foundation
import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UILabel!
    
    var noteTitle: String?
    var note: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
}
