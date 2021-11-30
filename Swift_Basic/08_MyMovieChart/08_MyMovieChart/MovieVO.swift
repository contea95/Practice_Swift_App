//
//  MovieVO.swift
//  08_MyMovieChart
//
//  Created by 한상혁 on 2021/11/10.
//

import Foundation
import UIKit

// 영화 정보를 담기 위한 객체
class MovieVO {
    var thumbnail: String?
    var title: String?
    var description: String?
    var detail: String?
    var opendate: String?
    var rating: Double?
    
    // 영화 썸네일 이미지를 담을 UIImage 객체
    var thumbnailImage: UIImage?
}
