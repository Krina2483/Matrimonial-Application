//
//  TabBarViewController.swift
//  Matrimonial application
//
//  Created by Krina Bhalodiya on 25/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(chnageIndex(notifacation:)), name: Notification.Name("changeIndex"), object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func chnageIndex(notifacation: NSNotification){
        
        let index = notifacation.userInfo?["index"] as! Int
        self.selectedIndex = index
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
