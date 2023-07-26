//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by Ecem Akçay on 25.07.2023.
//

import UIKit

protocol PickerViewControllerDelegate {
    func didSelectGroup(_ type: Group)
}

class PickerViewController: UIViewController {
    

    @IBOutlet weak var filterPickerView: UIPickerView!
    
    private var selectedGroup: Group?
    
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
    }
    
    @IBAction func cancelButtonAct(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func doneButtonAct(_ sender: UIButton) {
        delegate?.didSelectGroup(selectedGroup ?? .allContacts)
        dismiss(animated: true)
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Group.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Group.allCases[row].group
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGroup = Group.allCases[row]
    }
}

