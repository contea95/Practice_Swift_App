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
//    var dataset = [
//        ("다크나이트", "1 디스크립션", "2008-09-04", 8.95, "darknight.jpg"),
//        ("호우시절", "2 디스크립션", "2015-04-08", 7.91, "rain.jpg"),
//        ("말할 수 없는 비밀", "3 디스크립션", "2009-06-12", 9.99, "secret.jpg")]
    // 현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        
//        for (title, desc, opendate, rating, thumbnail) in self.dataset {
//            let mvo = MovieVO()
//            mvo.title = title
//            mvo.description = desc
//            mvo.opendate = opendate
//            mvo.rating = rating
//            mvo.thumbnail = thumbnail
//
//            datalist.append(mvo)
//        }
        return datalist
    }()
    
    @IBOutlet var moreBtn: UIButton!
    
    @IBAction func more(_ sender: Any) {
        // 현재 페이지에 1 추가
        self.page += 1
        // 영화차트 API 호출
        self.callMovieAPI()
        // 데이터를 다시 불러오도록 데이블 뷰 갱신
        self.tableView.reloadData()
    }
    
    
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
        self.callMovieAPI()
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
        // 로그 출력
        NSLog("제목: \(row.title!), 호출된 행번호: \(indexPath.row)")
        
        // == MovieCell을 사용해 TableView 커스텀셀 그리기 ===
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
  
//        UIImage를 읽어 저장하는 부분 추가 시 주석처리
//        // 추가된 부분 : 이미지뷰 처리
//        let url: URL! = URL(string: row.thumbnail!)
//
//        // 이미지를 읽어와 Data 객체에 저장
//        let imageData = try! Data(contentsOf: url)
        DispatchQueue.main.async(execute: {
            NSLog("비동기로 실행되는 부분입니다")
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
            
        NSLog("메소드 실행을 종료 후 셀을 리턴")
        
        return cell
    }
    // 테이블 셀 클릭 시 액션 처리 메서드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    func callMovieAPI() {
        // 1. URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2. REST API 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3. 데이터 전송 결과 로그 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다."
        NSLog("API RESULT = \(log)")
        
        // 4. JSON 객체 파싱해서 NSDictionary객체로 저장
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 5. 데이터 구조에 따라서 차례대로 파싱
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API DATA를 MovieVO 객체에 저장
            for row in movie {
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트 구현할 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // 웹상에 있는 이미지를 읽어 UIImage 객체로 생성
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                // list 배열 추가
                self.list.append(mvo)
                
                // 7. 전체 데이터 카운트 얻기
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                // 8. totalCount가 읽어온 데이터 크기와 같거나 클 경우 버튼 막기
                if (self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
            }
        } catch {
            NSLog("Parse Error!")
        }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        // 인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        
        // 저장된 이미지가 있으면 반환, 없으면 내려받아서 저장 후 반환
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
}
