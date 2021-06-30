//
//  AddViewController.swift
//  12_Table
//
//  Created by 한상혁 on 2021/07/01.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    var selectedItem = "cart.png"

    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image!)
        }
        imageView.image = imageArray[0]
    }
    
    @IBAction func btnAddItem(_ sender: Any) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(selectedItem)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFileOrigin.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return itemsImageFile[row]
//    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerImageView = UIImageView(image: imageArray[row])
        pickerImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return pickerImageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem = itemsImageFileOrigin[row]
        imageView.image = imageArray[row]
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
