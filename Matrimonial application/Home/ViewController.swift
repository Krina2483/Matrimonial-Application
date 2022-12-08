//
//  ViewController.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 22/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var candidates : [Candidate] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Tableview.delegate = self
        Tableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        candidates = HomeDAL.getCandidates()
        Tableview.reloadData()
    }
    
    @IBOutlet weak var Tableview: UITableView!
    
    @IBAction func addNewCandidate(_ sender: Any) {
        let acvc : addCandidateViewController = storyboard?.instantiateViewController(withIdentifier: "addCandidateViewController") as! addCandidateViewController
        self.navigationController?.pushViewController(acvc, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 1
        return candidates.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CandidateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CandidateTableViewCell
        
        let c:Candidate = candidates[indexPath.section]
        
        cell.candidateName.text = c.candidateName
        cell.candidateInfo.text = c.candidateDateOfBirth
        cell.candidateEducation.text = c.candidateEducation
        cell.candidateImg.image = UIImage(named: c.candidateGender == "Male" ? "Male.png":"Female.png")!
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cdvc : CandidateDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "CandidateDetailsViewController") as! CandidateDetailsViewController
        let c: Candidate = candidates[indexPath.section]
        cdvc.Details = c
        self.navigationController?.pushViewController(cdvc, animated: true)
    }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        
        func LoadUserData(){
            candidates = HomeDAL.getCandidates()
            Tableview.reloadData()
        }
        
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            
            let c:Candidate = self.candidates[indexPath.section]
            
            let delate = UITableViewRowAction(style: .default, title: "Delate") { UITableViewRowAction, IndexPath in
                let alert = UIAlertController(title: "Alert", message: "are you sure to delate \(c.candidateName)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default , handler: { UIAlertAction in
                    
                    let status = HomeDAL.DelateCandidate(c: c)
                    
                    if status{
                        self.LoadUserData()
                    }
                    
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: .default , handler: { UIAlertAction in
                    
                }))
                
                self.present(alert, animated: true)
            }
            let edit = UITableViewRowAction(style: .default, title: "Edit") { UITableViewRowAction, indexPath in
                
                let acvc:addCandidateViewController = self.storyboard?.instantiateViewController(withIdentifier: "addCandidateViewController") as! addCandidateViewController
                
                acvc.c = c
                acvc.screenfrom = "edit"
                
                self.navigationController?.pushViewController(acvc, animated: true)
            }
            
            edit.backgroundColor = .gray
            return [delate,edit]
        }
    }

