//
//  PageModel.swift
//  Pinch
//
//  Created by Elif Bilge Parlak on 20.06.2023.
//

import Foundation

struct Page : Identifiable {
    let id : Int
    let imageName : String
}

extension Page {
    var thumbnailName : String {
        return "thumb-" + imageName
    }
}
