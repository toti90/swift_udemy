//
//  ViewController.swift
//  SeeFood
//
//  Created by Tamás Tóth on 2019. 06. 11..
//  Copyright © 2019. Tamás Tóth. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
     @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerCamera = UIImagePickerController()
    let imagePickerAlbum = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerCamera.delegate = self
        imagePickerCamera.sourceType = .camera
        imagePickerCamera.allowsEditing = false
        imagePickerAlbum.delegate = self
        imagePickerAlbum.sourceType = .photoLibrary
        imagePickerAlbum.allowsEditing = false
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Unable to convert userImage to CiImage")
            }
            
            detect(image: ciimage)
            
            
        }
        
        imagePickerCamera.dismiss(animated: true, completion: nil)
        imagePickerAlbum.dismiss(animated: true, completion: nil)
        
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML model failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Make CoreMLRequest failed")
            }
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog") {
                    self.navigationItem.title = "Hotdog!"
                } else {
                    self.navigationItem.title = "Not Hotdog!"
                    print(firstResult)
                }
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
           try! handler.perform([request])
        }catch {
            print(error)
        }
        
    }
   
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePickerCamera, animated: true, completion: nil)
        
    }
    @IBAction func searchTapped(_ sender: UIBarButtonItem) {
        
        present(imagePickerAlbum, animated: true, completion: nil)
        
    }
    
}

