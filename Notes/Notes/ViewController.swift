//
//  ViewController.swift
//  Notes
//
//  Created by Léo MARLIERE on 30/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var noteTable: UITableView!
    @IBOutlet var noNoteLabel: UILabel!
    
    var noteModels: [(title: String, note: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes List"
        noteTable.delegate = self
        noteTable.dataSource = self
        noNoteLabel.isHidden = !noteModels.isEmpty
    }
    
    
    @IBAction func didTapNewNote() {
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "NewNoteViewController") as? NewNoteViewController else {
            return
        }
        
        viewController.completion = { noteTitle, noteText in
            self.noteModels.append((title: noteTitle, note: noteText))
            self.noNoteLabel.isHidden = true
            self.noteTable.isHidden = false
            self.noteTable.reloadData()
            self.navigationController?.popToRootViewController(animated: true)
        }
    
        viewController.title = "New Note"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ViewController {
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = noteModels[indexPath.row].title
        cell.detailTextLabel?.text = noteModels[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as? ViewController else {
            return
        }
        
        viewController.title = "Note"
        navigationController?.pushViewController(viewController, animated: true)

    }
}

