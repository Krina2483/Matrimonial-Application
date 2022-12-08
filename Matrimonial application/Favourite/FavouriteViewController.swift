//
//  FavouriteViewController.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 24/11/22.
//

import UIKit

class FavouriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var FavouritecandidatesArray:[Candidate] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        FavouritecandidatesArray = HomeDAL.getFavouriteCandidate()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavouritecandidatesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favcell: FavouriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath) as! FavouriteTableViewCell
        
        
        let C:Candidate = FavouritecandidatesArray[indexPath.row]
        
        
        favcell.CandidateImage.image = UIImage(named: C.candidateGender == "Male" ? "Male.png":"Female.png")
        favcell.CandidateName.text = C.candidateName
        favcell.CandidateEducation.text = C.candidateEducation
        favcell.CandidateDateOfBirth.text = String(C.candidateDateOfBirth)
        
        return favcell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cdvc : CandidateDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "CandidateDetailsViewController") as! CandidateDetailsViewController
        let c: Candidate = FavouritecandidatesArray[indexPath.row]
        cdvc.Details = c
        self.navigationController?.pushViewController(cdvc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
