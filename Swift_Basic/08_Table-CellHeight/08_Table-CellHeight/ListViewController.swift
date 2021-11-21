//
//  ListViewController.swift
//  08_Table-CellHeight
//
//  Created by 한상혁 on 2021/11/19.
//

import Foundation
import UIKit
class ListViewController: UITableViewController {
    // 테이블 뷰에 연결할 데이터를 저장하는 배열
    var list = [String]()
    
    
    @IBAction func add(_ sender: Any) {
        // 1. 알림창 객체 인스턴스 생성
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        // 2. 알림창에 입력폼 추가
        alert.addTextField() { tf in
            tf.placeholder = "내용을 입력하세요"
        }
        
        // 3. OK 버튼 객체 생성
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            // 4. 알림창의 0번째 입력필드에 값이 있으면
            if let title = alert.textFields?[0].text {
                // 5. 배열에 입력된 값을 추가하고 테이블 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        // 취소 객체버튼 생성
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        // 6. 알림창 객체에 버튼 객체 등록
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 7. 알림창 띄우기
        self.present(alert, animated: false)
    }
    // 테이블 뷰의 행 수 결정하는 메서드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    // 테이블 뷰 가로행 내용 결정 메서드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. "cell" 아이디 가진 셀 읽어오기
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 셀의 기본 텍스트 레이블 행 수 제한 없애기
        cell.textLabel?.numberOfLines = 0
        // 셀의 기본 텍스트 레이블에 배열 변수의 값 할당
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50 // 대충 정한 높이값
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    // == 셀프 리사이징 셀 방식 사용 시 필요 없음 ==
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//
//        // 높이 조절. 기본 높이 60 + 글 길이 30자 넘어가면 20만큼 늘림
//        let height = CGFloat(60 + (row.count / 30) * 20)
//        return height
//    }
    
}
