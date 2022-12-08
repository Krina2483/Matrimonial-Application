//
//  SearchViewController.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 25/11/22.
//

import UIKit
    
    class SearchViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
        @IBOutlet weak var CasteOutlet: UITextField!
        @IBOutlet weak var AgeGroup1: UITextField!
        @IBOutlet weak var AgeGroup2: UITextField!
        
//        @IBOutlet weak var CasteOutlet: UITextField!
//        
//       
//      @IBOutlet weak var AgeGroup1: UITextField!
//        
//    @IBOutlet weak var AgeGroup2: UITextField!
        @IBOutlet weak var GenderSegmentOutlet: UISegmentedControl!
        
        
        var SelectGender:String = "All"
        var Castes:[Caste] = []
        var selectedCaste:String = ""
        var Castpiker: UIPickerView = UIPickerView()
        var CandidateSearchArray:[Candidate] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            Castpiker.delegate = self
            Castpiker.dataSource = self
            
            
            CasteOutlet.inputView = Castpiker
            Castes = CasteDAL.getUser()
            
            // Do any additional setup after loading the view.
        }
        
        
        @IBAction func GenderSelectionAction(_ sender: Any) {
            
            switch  GenderSegmentOutlet.selectedSegmentIndex {
            case 0:
                SelectGender = "All"
            case 1:
                SelectGender = "Male"
            default :
                SelectGender = "Female"
            }
            
        }
        
        
        @IBAction func SearchBtnAction(_ sender: Any) {
            
           // CandidateSearchArray = HomeDAL.Search(Gender: SelectGender, Caste: selectedCaste, Age1: Int(AgeGroup1.text ?? "0") ?? 0, Age2: Int(AgeGroup2.text ?? "0") ?? 0)
            
            //self.selecetchangevalue?.changearrayvalue(value: CandidateSearchArray,Screen: "Search")
            
            //self.navigationController?.popViewController(animated: true)
            let indexDeta: [String : Int] = ["index" : 0]
            NotificationCenter.default.post(name: Notification.Name("changeIndex"),object: nil,userInfo: indexDeta)
            self.view.endEditing(true)
            
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
            let c:Caste = Castes[row]
            CasteOutlet.text = c.CasteName
            selectedCaste = c.CasteName
            CasteOutlet.resignFirstResponder()
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

