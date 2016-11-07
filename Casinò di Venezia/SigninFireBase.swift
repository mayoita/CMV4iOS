//
//  SigninFireBase.swift
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/09/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth





class SigninFireBase: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate, GIDSignInDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
 
    @IBOutlet weak var pickLabel: UILabel!
    @IBOutlet weak var closeButton: CMVCloseButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var registerLoginButton: UIButton!
    @IBOutlet weak var toggleLoginRegister: UISegmentedControl!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    var kFacebookAppID = "724548800932026"
    @IBOutlet weak var password: UITextField!
  
    @IBOutlet weak var signInButtonGoogle: GIDSignInButton!
    @IBOutlet weak var cognome: UITextField!
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    var oldUID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let myGradient = UIImage.init(named: "LogInColorPattern")
        
        registerLoginButton.setTitleColor(UIColor.init(patternImage: myGradient!), for: .normal)
       
        //Google SinIn
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        self.fbLoginButton.isHidden = false
        fbLoginButton.delegate = self
        nome.isHidden = true
        cognome.isHidden = true
        
        //Check the current user
        profileImage.layer.cornerRadius = 60
        profileImage.layer.masksToBounds = true
        self.fbLoginButton.readPermissions = ["public_profile", "email"]
        self.fbLoginButton.delegate = self
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector( handleSelectProfileImageView)))
        closeButton.color = UIColor.white
        profileImage.isHidden = true
        pickLabel.isHidden = true

    }
    
    func handleSelectProfileImageView (){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImage.image = selectedImage
        }
        pickLabel.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled picker")
        dismiss(animated: true, completion: nil)
    }
    
    private func registerUserIntoDatabaseWithUID (uid: String, oldUid:String, values: [String: AnyObject]){
        
        let refDBase = FIRDatabase.database().reference(fromURL: "https://cmv-gioco.firebaseio.com/")
        let userRef = refDBase.child("users").child(uid)
        let dic = refDBase.child("users").child(oldUid)
        dic.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
            userRef.setValue(snapshot.value as! [String : AnyObject])
            userRef.updateChildValues(values)
            //delete user from database
            dic.removeValue()
            self.dismiss(animated: true, completion: nil)
        })
        //dic.removeValue()
    }
    
    @IBAction func setLoginRegis(_ sender: AnyObject) {
        if toggleLoginRegister.selectedSegmentIndex == 0 {
            registerLoginButton.titleLabel?.text = "Login"
            nome.isHidden = true
            cognome.isHidden = true
            profileImage.isHidden = true
            pickLabel.isHidden = true
        } else {
            registerLoginButton.titleLabel?.text = "Register"
            nome.isHidden = false
            cognome.isHidden = false
            profileImage.isHidden = false
            pickLabel.isHidden = false
        }
        
    }
    @IBAction func handeldRegister(_ sender: AnyObject) {
        
        guard let emailt = email.text, let passwordt = password.text, let name = nome.text, let surname = cognome.text else {
            print ("incorrect")
            return
        }
        if (toggleLoginRegister.selectedSegmentIndex == 1) {
    
            let prevUser = FIRAuth.auth()?.currentUser
            let prevUID = prevUser?.uid

            //Delete user fron Authentication
            prevUser?.delete { error in
                if let error = error {
                    // An error happened.
                    print(error.localizedDescription)
                } else {
                    // Account deleted.
                    print("Eliminato con successo")
                }
            }
        FIRAuth.auth()?.createUser(withEmail: emailt, password: passwordt, completion: { (user, error) in
            if (error != nil) {
                if #available(iOS 8.0, *) {
                    let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    // Fallback on earlier versions
                }
                return
            }
            guard let uid = user?.uid else {
                return
            }
            let imageName = NSUUID().uuidString
            let storageRef = FIRStorage.storage().reference().child("profile_images").child("\(imageName).png")
            if let uploadData = UIImagePNGRepresentation(self.profileImage.image!) {
                storageRef.put(uploadData, metadata: nil, completion:
                    {(metadata, error) in
                        if error != nil {
                            print(error?.localizedDescription)
                            return
                        }
                        if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                            let values = ["name":name, "surname":surname, "profileImageURL":profileImageUrl]
                           
                            self.registerUserIntoDatabaseWithUID(uid: uid, oldUid: prevUID!, values: values as [String : AnyObject])
                            //self.dismiss(animated: true, completion: nil)
                        }
                        
                        
                        print(metadata)
                })
            }
            
            
        })
        } else {
            let credential = FIREmailPasswordAuthProvider.credential(withEmail: emailt, password: passwordt)
            FIRAuth.auth()?.currentUser?.link(with: credential, completion: { (user, error) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }
//        if isValidEmail(testStr: email) {
//            print("ok")
//        }
//        if (password == "") {
//            if #available(iOS 8.0, *) {
//                let alert = UIAlertController(title: "Alert", message: "Set password", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            } else {
//                // Fallback on earlier versions
//            }
//        
//        }
//        if (nome.text == "") {
//            if #available(iOS 8.0, *) {
//                let alert = UIAlertController(title: "Alert", message: "Set name", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            } else {
//                // Fallback on earlier versions
//            }
//            
//        }
//        if (cognome.text == "") {
//            if #available(iOS 8.0, *) {
//                let alert = UIAlertController(title: "Alert", message: "Set surname", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            } else {
//                // Fallback on earlier versions
//            }
//
//        }
    }
    
    @IBAction func dismissView(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }



    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        self.fbLoginButton.isHidden = true
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if (error != nil) {
            //handle error
            //self.fbLogInButton.hidden = true
            print("Error!")
            self.fbLoginButton.isHidden = false
        } else if (result.isCancelled) {
            print("Cancelled!")
            self.dismiss(animated: true, completion: nil)
            self.fbLoginButton.isHidden = true
        } else {
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
           
            signInWithCredentials(credentials: credential)
            //sigIn(credentials: credential)

        }
     
        
    }
    func signInWithCredentials (credentials: FIRAuthCredential) {
        FIRAuth.auth()?.currentUser?.link(with: credentials, completion: { (user, error) in
            if (error != nil) {
                print(error?.localizedDescription)
            } else {
                for profile in (user?.providerData)! {
        
                    user?.updateEmail(profile.email!) { error in
                        if let error = error {
                            // An error happened.
                            print(error.localizedDescription)
                        } else {
                            // Email updated.
                        }
                    }
                }
               
                self.dismiss(animated: true, completion: nil)
            }
        })
        
        
    }
    func sigIn (credentials: FIRAuthCredential) {
        
        let prevUser = FIRAuth.auth()?.currentUser
        let prevUID = prevUser?.uid
        FIRAuth.auth()?.currentUser?.delete(completion: { (error) in
            if error != nil {
                return
            }
        })
      
        FIRAuth.auth()?.signIn(with: credentials) { (user, error) in
            print("User log in to FireBase!")
//            let currentUser = FIRAuth.auth()?.currentUser
//            let curUID = currentUser?.uid
//           
//            let name = (currentUser?.displayName!)! as String
//            
//            let values2 = ["name":name, "surname":"", "profileImageURL":""]
//            self.registerUserIntoDatabaseWithUID(uid: (currentUser?.uid)!, oldUid:prevUID!,  values: values2 as [String : AnyObject])
            //self.dismiss(animated: true, completion: nil)
        }
        
        
    
    
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Log out1")
    }
    
    func sign(_ signIn: GIDSignIn, didSignInFor user: GIDGoogleUser, withError error: Error?) {
        if error == nil {
            let authentication = user.authentication
            let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                              accessToken: (authentication?.accessToken)!)
            signInWithCredentials(credentials: credential)
            //sigIn(credentials: credential)
        }
        else {
            print(error?.localizedDescription)
        }
    }

    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
