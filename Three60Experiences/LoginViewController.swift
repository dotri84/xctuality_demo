//
//  LoginViewController.swift
//  Three60Experiences
//
//  Created by Tri Do on 01/03/2022.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let userKey = "user"
    private let standards = UserDefaults.standard
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileImageView: AvatarImageView!
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundColor = UIColor(patternImage: UIImage(named: "view_background")!)
        self.view.backgroundColor = backgroundColor
        profileView.backgroundColor = backgroundColor
        
        loadSavedUser()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func logOut(_ sender: UIButton) {
        profileView.isHidden = true
        standards.removeObject(forKey: userKey)
        standards.synchronize()
    }
    
    @IBAction func changeProfileImage(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Select photo", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "From Gallery", style: .default, handler:{ (UIAlertAction)in
            self.fromGallery()
        }))
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler:{ (UIAlertAction)in
            self.takePhoto()
        }))
        
        alert.addAction(UIAlertAction(title: "Remove Photo", style: .default, handler:{ (UIAlertAction)in
            DispatchQueue.main.async {
                self.profileImageView.image = UIImage(named: "profile")
            }
        }))

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Ok button")

        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func fromGallery() {
        self.showPickerWithSourceType(UIImagePickerController.SourceType.savedPhotosAlbum)
    }
    
    func takePhoto() {
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
            self.showPickerWithSourceType(UIImagePickerController.SourceType.camera)
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                DispatchQueue.main.async {
                    if granted {
                        self.showPickerWithSourceType(UIImagePickerController.SourceType.camera)
                    } else {
                        Common.shared.showAlert(message: "You need to grant permissions to camera to take a picture.", parent: self)
                    }
                }
            })
        }
    }

    private func showPickerWithSourceType(_ sourceType: UIImagePickerController.SourceType) {
        var vc: UIViewController!
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.mediaTypes = ["public.image", "public.movie"]
            imagePicker.sourceType = sourceType
            imagePicker.videoQuality = UIImagePickerController.QualityType.typeMedium
            vc = imagePicker
        }
        else {
            let alert = UIAlertController(title: "Error", message: "This feature is supported on real devices only", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            vc = alert
        }
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        var image = info[.editedImage] as? UIImage
        if image == nil {
            image = info[.originalImage] as? UIImage
        }

        if image == nil {
            print("No image found")
            return
        }

        profileImageView.image = image
    }
    
    @IBAction func login(_ sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        if username == "harry" && password == "123456" {
            let user = User(name: "Harry Potter", username: "harry", avatar: "https://avatarfiles.alphacoders.com/139/139815.jpg")
            
            UserProfileCache.save(user)
            
            loadSavedUser()
        }
        else {
            Common.shared.showAlert(message: "Wrong credentials!", parent: self)
        }
    }

    func loadSavedUser() {
        
        if let user = UserProfileCache.get() {
            profileView.isHidden = false
            usernameLbl.text = user.username
            nameLbl.text = user.name
        }
        else {
            profileView.isHidden = true
        }
    }
}
