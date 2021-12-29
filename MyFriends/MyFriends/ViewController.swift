//
//  ViewController.swift
//  MyFriends
//
//  Created by 강민규 on 2021/12/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellidentifier: String = "cell"
    var friends: [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count // row 개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellidentifier, for: indexPath)
        
        let friend: Friend = self.friends[indexPath.row]
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell // 셀 디큐에 담아뒀다가 다시 리턴하기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view. 뷰가 로딩된 이후에 해야할 일을 해달라
        
        // 제이슨 에셋 불러와서 프렌즈 배열에 넣기
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else{
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
            
        }catch{
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
 

}

