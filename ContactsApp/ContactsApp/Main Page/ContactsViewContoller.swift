//
//  ContactsViewContoller.swift
//  ContactsApp
//
//  Created by Ecem Akçay on 24.07.2023.
//

import UIKit

class ContactsViewContoller: UIViewController{
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    private var selectedGroup: Group? {
        didSet {
            contactsTableView.reloadData()
        }
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action: #selector(filterButtonAct))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterButtonAct() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as? PickerViewController {
            vc.delegate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
    
}

//MARK: - PickerViewController Delegate Methods
extension ContactsViewContoller: PickerViewControllerDelegate {
    func didSelectGroup(_ type: Group) {
        selectedGroup = type
    }
}

//MARK: TableView Delegate Methods
extension ContactsViewContoller: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSections().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setSections()[section].group
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterContacts(section).count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.selectedContacts = filterContacts(indexPath.section)
        detailVC.selectedPerson = filterContacts(indexPath.section)[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        
        cell.contactsImageView.image = UIImage(named: filterContacts(indexPath.section)[indexPath.row].gender!.gender.lowercased())
       
        cell.contactsNameLabel.text = filterContacts(indexPath.section)[indexPath.row].name
       
        
        return cell
    }
    
    private func setSections() -> [Group] {
        if let selectedGroup = selectedGroup, selectedGroup != .allContacts {
            return [selectedGroup]
        } else {
            var allSections = Group.allCases
            if let index = allSections.firstIndex(of: .allContacts) {
                allSections.remove(at: index)
            }
            return allSections
        }
    }

    private func filterContacts(_ sectionIndex: Int) -> [Contact] {
        let sectionGroup = setSections()[sectionIndex]
        
        if sectionGroup == .allContacts {
            return Contacts.contactInfos
        } else {
            return Contacts.contactInfos.filter { $0.group == sectionGroup }
        }
    }



    
}
