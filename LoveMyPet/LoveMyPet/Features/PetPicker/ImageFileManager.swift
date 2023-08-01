//
//  ImageFileManager.swift
//  LoveMyPet
//
//  Created by userext on 27/07/23.
//

import Foundation
import SwiftUI

func loadImage(_ url: URL) -> UIImage? {
    if let imagem = UIImage(contentsOfFile: url.path) {
        return imagem
    } else {
        return nil
    }
}
func saveImagem(_ imagem: UIImage, caminhoDestino: URL) {
    do {
        if let data = imagem.jpegData(compressionQuality: 1.0) {
            try data.write(to: caminhoDestino)
        }
    } catch {
    }
}
