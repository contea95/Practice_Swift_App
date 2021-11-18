//
//  ListViewController.swift
//  08_MyMovieChart
//
//  Created by 한상혁 on 2021/11/10.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    // 튜플로 구성한 데이트 세트
    var dataset = [
        ("다크나이트", "1 디스크립션", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "2 디스크립션", "2015-04-08", 7.91, "rain.jpg"),
        ("말할 수 없는 비밀", "3 디스크립션", "2009-06-12", 9.99, "secret.jpg")]
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {
        // 처음 행
// 리팩토링
//        var mvo = MovieVO()
//        mvo.title = "다크나이트"
//        mvo.description = "닼나 디스크립션~~"
//        mvo.opendate = "2009-10-08"
//        mvo.ration = 7.31
//        // 배열에 추가하기
//        self.list.append(mvo)
//
//        // 두번째 행
//        mvo = MovieVO()
//        mvo.title = "2"
//        mvo.description = "2 디스크립션~~"
//        mvo.opendate = "2015-10-08"
//        mvo.ration = 9.19
//        // 배열에 추가하기
//        self.list.append(mvo)
//
//        // 세번째 행
//        mvo = MovieVO()
//        mvo.title = "3"
//        mvo.description = "3 디스크립션~~"
//        mvo.opendate = "2008-09-04"
//        mvo.ration = 9.19
//        // 배열에 추가하기
//        self.list.append(mvo)
    }
    
    // 테이블 뷰의 개수를 반환하는 메서드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    // 테이블 뷰의 셀을 구성하는 메서드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스 읽어오기
        let row = self.list[indexPath.row]
//        // 테이블 셀 객체를 큐로부터 가져오기
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
//        // 각 레이블에 변수를 받기 위해 선언
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
//        // 데이터 소스에 저장된 값을 각 레이블 변수에 할당
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
        
        // == MovieCell을 사용해 TableView 커스텀셀 그리기 ===
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    // 테이블 셀 클릭 시 액션 처리 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
}
