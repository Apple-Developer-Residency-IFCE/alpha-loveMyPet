import SwiftUI
class ImageFileManager {

    func loadImage(named imageName: String) -> UIImage? {
        if let image = UIImage(named: imageName) {
            return image
        } else {
            return nil
        }
    }
    func saveImage(image: UIImage, withName imageName: String) -> Bool {
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            return false
        }
        
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(imageName).jpg")
        
        do {
            try imageData.write(to: fileURL)
            return true
        } catch {
            return false
        }
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
