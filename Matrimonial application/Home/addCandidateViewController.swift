//
//  addCandidateViewController.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 23/11/22.
//

import UIKit

class addCandidateViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var flag = true
    var favourite:Int32 = 0
    var Gender:String = ""
    
    @IBOutlet weak var HeartBtn: UIBarButtonItem!
    @IBAction func HeartBtn(_ sender: Any) {
        if flag == true {
            favourite = 1
            HeartBtn.image = UIImage(systemName: "heart.fill" )
            FavouriteBtn.setTitle("Remove from Favourite", for: .normal)
            flag = false
            
        }
        else{
            favourite = 0
            HeartBtn.image = UIImage(systemName: "heart" )
            FavouriteBtn.setTitle("Add to favourite", for: .normal)
            flag = true
        }
    }
    @IBOutlet weak var FavouriteBtn: UIButton!

    @IBAction func FavouriteBtn(_ sender: Any) {
        if flag == true {
            favourite = 1
            HeartBtn.image = UIImage(systemName: "heart.fill" )
            FavouriteBtn.setTitle("Remove from Favourite", for: .normal)
            flag = false
        }
        else {
            favourite = 0
            HeartBtn.image = UIImage(systemName: "heart" )
            FavouriteBtn.setTitle("Add to favourite", for: .normal)
            flag = true
        }
    }
    
    
    @IBOutlet weak var CandidateProfileImage: UIImageView!
    @IBOutlet weak var CandidateName: UITextField!
    @IBOutlet weak var CandidateGender: UISegmentedControl!
    @IBOutlet weak var CandidateDateOfBirth: UIDatePicker!
    @IBOutlet weak var CandidateAge: UITextField!
    @IBOutlet weak var CandidateCaste: UITextField!
    @IBOutlet weak var CandidateEducation: UITextField!
    @IBOutlet weak var CandidateHeight: UITextField!
    @IBOutlet weak var CandidateAddress: UITextField!
    @IBOutlet weak var CandidateState: UITextField!
    @IBOutlet weak var CandidateCity: UITextField!
    @IBOutlet weak var CandidatePhone: UITextField!
    @IBOutlet weak var CandidateMobile: UITextField!
    @IBOutlet weak var CandidateRemarks: UITextField!
    @IBOutlet weak var CandidateEmail: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var Castpiker: UIPickerView = UIPickerView()
    var DOBPiker: UIDatePicker = UIDatePicker()
    
    var Castes:[Caste] = []
    var selectedCaste:Caste = Caste()
    var c:Candidate = Candidate()
    var screenfrom = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FavouriteSegmentOutlets.selectedSegmentIndex = 1
      
        Castpiker.delegate = self
        Castpiker.dataSource = self
        CandidateCaste.inputView = Castpiker
        Castes = CasteDAL.getUser()
        
        if screenfrom == "edit"{
            self.title = c.candidateName
            CandidateName.text = c.candidateName
            CandidateProfileImage.image = UIImage(named: c.candidateGender == "Male" ? "Male":"Female")
            
            print(c.candidateDateOfBirth)
            let df = DateFormatter()
            df.dateFormat = "dd-MM-yyyy"
            let date = df.date(from: c.candidateDateOfBirth)
            CandidateDateOfBirth.setDate(date! , animated: true)
            Castpiker.selectRow(Int(c.candidateCastId)-1, inComponent: 0, animated: true)
            CandidateCaste.text = c.candidateCast
            CandidateEducation.text = c.candidateEducation
            CandidateHeight.text = c.candidateHeight
            CandidateAddress.text = c.candidateAddress
            CandidateCity.text = c.candidateCity
            CandidateState.text = c.candidateState
            CandidatePhone.text = c.candidatePhoneNo
            CandidateMobile.text = c.candidateMobileNo
            CandidateEmail.text = c.candidateEmai
            CandidateRemarks.text = c.candidateRemark
            CandidateAge.text = String(c.candidateAge)
            submitButton.setTitle("Update", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Castes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c:Caste = Castes[row]
        
        return c.CasteName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let C:Caste = Castes[row]
        CandidateCaste.text = C.CasteName
        selectedCaste = C
        CandidateCaste.resignFirstResponder()
    }
    
    
    @IBAction func GenderSegmentAction(_ sender: Any) {
        switch CandidateGender.selectedSegmentIndex
        {
        case 0:
            Gender = "Male"
            break
            
        default:
            Gender = "Female"
        }
    }
    
    @IBAction func Submit(_ sender: Any) {
        let submit:Candidate = Candidate()
        
        submit.candidateName = CandidateName.text ?? ""
        submit.candidateGender = Gender
    
        let selectdate = DOBPiker.date
        
        let formate = DateFormatter()
        formate.dateFormat = "dd-mm-yy"
        submit.candidateDateOfBirth = formate.string(from: selectdate)
        submit.candidateCastId = selectedCaste.CasteId
        submit.candidateEducation = CandidateEducation.text!
        submit.candidateHeight = CandidateHeight.text!
        submit.candidateAddress = CandidateAddress.text!
        submit.candidateCity = CandidateCity.text!
        submit.candidateState = CandidateState.text!
        submit.candidatePhoneNo = CandidatePhone.text!
        submit.candidateMobileNo = CandidateMobile.text!
        submit.candidateRemark = CandidateRemarks.text!
        submit.candidateisFavourite = favourite
        submit.candidateAge = Int32(CandidateAge.text ?? "0") ?? 0

        var status:Bool = false
        
        if screenfrom == "edit"{
            
            submit.candidateProfileId = c.candidateProfileId
            status = HomeDAL.EditCandidate(c: submit)
            
        }
        else{
            
            status = HomeDAL.AddCandidate(c: submit)
        }
        
        if status{
            let alert = UIAlertController(title: "add", message: screenfrom == "edit" ? "you just upadate \(submit.candidateName)" :"you just add new user successfully ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default,handler: {UIAlertAction in
                
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true)
        }

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
