//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Ecem Akçay on 26.07.2023.
//

import UIKit

class DetailViewController : UIViewController{
    
    
    @IBOutlet weak var detailOtherGroupLabel: UILabel!
    @IBOutlet weak var detailGroupLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var groupCollectionView: UICollectionView!

    var selectedPerson : Contact?
    var selectedContacts: [Contact] = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupCollectionView.dataSource = self
        groupCollectionView.delegate = self
       
        detailNameLabel.text = selectedPerson!.name
        detailGroupLabel.text = selectedPerson!.group!.group
        detailOtherGroupLabel.text = "Other \(String(describing: selectedPerson!.group!.group))"
        detailImageView.image = UIImage(named:selectedPerson?.gender!.gender ?? "" )
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let viewWidth = self.groupCollectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        design.itemSize = CGSize(width: (viewWidth-30)/2, height: (viewWidth-30)/2)
        design.scrollDirection = .horizontal
        groupCollectionView.collectionViewLayout = design
    }
}
extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        cell.cellImageView.image = UIImage(named: String(describing:selectedContacts[indexPath.row].gender!.gender))
        cell.cellLabel.text = selectedContacts[indexPath.row].name
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
}
