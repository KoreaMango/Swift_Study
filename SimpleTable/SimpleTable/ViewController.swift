//
//  ViewController.swift
//  SimpleTable
//
//  Created by 강민규 on 2021/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        
        //self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.dates.count-1, section: 2)
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    let customCellIdentifier: String = "customCell"

    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3    }
    
    // 테이블 뷰에 로우가 몇개여야 하는지 알려달라는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
            
        }
    }
    
    // 로우마다 해당하는 셀을 돌려달라는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) // 뷰 재사용 메소드
            
            let text: String = indexPath.section == 0 ? korean[indexPath.row]: english[indexPath.row]
            cell.textLabel?.text = text
            // 셀의 재사용을 확인하는 코드
//            if indexPath.row == 1 {
//                cell.backgroundColor = UIColor.red
//            }else{
//                cell.backgroundColor = UIColor.white
//            }
            return cell

        }else{// 강제 캐스팅 as ! CustomTableViewCell
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel.text = self.timeFormatter.string(from:self.dates[indexPath.row])
            return cell
        }
      
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // 세그가 여러개인 경우 segue.identifier
        
        guard let nextViewController: SecondViewController =
            segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        // 프로퍼티에 넣어줘서 보내줘야함
        // 바로 레이블에 넣지 못함
        // 세컨드 뷰의 레이블은 아직 생성되지 않음
        nextViewController.textToset = cell.textLabel?.text
    }
    

    
    
}


