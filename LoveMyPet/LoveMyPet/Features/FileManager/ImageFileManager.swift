import SwiftUI
class ImageFileManager {
    func loadImage(named imageName: String) -> Data? {
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(imageName).jpg")
        do {
            return try Data(contentsOf: fileURL)
        } catch {
            return nil
        }
    }
    func saveImage(imageData: Data, withName imageName: String) -> Bool {
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
