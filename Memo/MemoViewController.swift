//
//  MemoViewController.swift
//  Memo
//
//  Created by Hazuki Tamura on 2021/08/19.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!

    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveData.object(forKey: "title")as? String
        contentTextView.text = saveData.object(forKey: "content")as? String
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    
    
    @IBAction func save(){
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        //alert
        let alert:UIAlertController = UIAlertController(title: "保存", message: "無事保存", preferredStyle: .alert)
        
        //button
        alert.addAction(UIAlertAction(
                            title: "OK", style: .default, handler: { action in
                                //ボタン押されたら
                                print("okが押された！")
                                self.navigationController?.popViewController(animated: true)
                            }
        
        ))
        
        present(alert, animated: true, completion: nil)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
