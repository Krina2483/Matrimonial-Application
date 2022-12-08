//
//  CandidateDetails.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 22/11/22.
//

import UIKit

class CandidateDetailsViewController: UIViewController {

    
    @IBOutlet weak var CandidateImage: UIImageView!
    @IBOutlet weak var CandidateName: UILabel!
    @IBOutlet weak var CandidateGender: UILabel!
    @IBOutlet weak var CandidateDateOfBirth: UILabel!
    @IBOutlet weak var CandidateAge: UILabel!
    @IBOutlet weak var CandidateCaste: UILabel!
    @IBOutlet weak var CandidateEducation: UILabel!
    @IBOutlet weak var CandidateHeight: UILabel!
    @IBOutlet weak var CandidateAddress: UILabel!
    @IBOutlet weak var CandidateCity: UILabel!
    @IBOutlet weak var CandidateState: UILabel!
    @IBOutlet weak var CandidatePhoneNo: UILabel!
    @IBOutlet weak var CandidateMobileNo: UILabel!
    @IBOutlet weak var CandidateEmail: UILabel!
    @IBOutlet weak var CandidateRemark: UILabel!
    
    var Details:Candidate = Candidate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        CandidateImage.image = UIImage(named: Details.candidateGender == "Male" ? "Male":"Female")!
        CandidateName.text = Details.candidateName 
        CandidateGender.text = Details.candidateGender
        CandidateDateOfBirth.text = Details.candidateDateOfBirth
        CandidateAge.text = String(Details.candidateAge)
        CandidateEducation.text = Details.candidateEducation
        CandidateHeight.text = Details.candidateHeight
        CandidateAddress.text = Details.candidateAddress
        CandidateCity.text = Details.candidateCity
        CandidateState.text = Details.candidateState
        CandidatePhoneNo.text = Details.candidatePhoneNo
        CandidateMobileNo.text = Details.candidateMobileNo
        CandidateEmail.text = Details.candidateEmai
        CandidateRemark.text = Details.candidateRemark
        CandidateCaste.text = Details.candidateCast
        
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
