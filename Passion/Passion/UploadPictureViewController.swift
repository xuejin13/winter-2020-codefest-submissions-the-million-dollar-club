//
//  UploadPictureViewController.swift
//  Passion
//
//  Created by Xuejin Gao on 1/22/20.
//  Copyright © 2020 Xuejin Gao. All rights reserved.
//

import UIKit

import AlamofireImage
import Parse

class UploadPictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
        
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func onTapPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        print("Camera tapped")
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            picker.sourceType = .camera
//        }
//        else{
//            picker.sourceType = .photoLibrary
//        }
        
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
//        let scaledImage = image.af_imageScaled(to: size)

        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPost(_ sender: Any) {
        
        print("Post clicked")
        
        let post = PFObject(className: "PersonalPost")
        post["author"] = PFUser.current()
        post["caption"] = commentField.text
        
        let date = Date().description
        let index = date.index(date.startIndex, offsetBy: 10)
        let dateSubstr = date.prefix(upTo: index)
        post["date"] = dateSubstr
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                print("Post saved")
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("Error in saving the post")
            }
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
