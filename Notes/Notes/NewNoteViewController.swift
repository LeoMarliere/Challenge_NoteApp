//
//  NotesViewController.swift
//  Notes
//
//  Created by Léo MARLIERE on 30/03/2022.
//

import Foundation
import UIKit

class NewNoteViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var noteTextField: UITextField!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .done, target: self, action: #selector(didTapSaveButton))
    }
    
    @objc func didTapSaveButton() {
        guard let title = titleTextField.text, let note = noteTextField.text,
              !title.isEmpty, !note.isEmpty else {
                  return
              }
        
        completion?(title,note)
    }

}
