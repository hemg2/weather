//
//  ViewController.swift
//  Weather
//
//  Created by 1 on 2022/05/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var assets: [cuntrey] = []
    // 화면 넘겨주기
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assets.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //코드작성으로넘기기 전 작성하기
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SeondViewController") else { return }
    
        navigationController?.pushViewController(viewController, animated: false)
    }
    //가져오는 상황
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: cuntresTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? cuntresTableViewCell else {return UITableViewCell() }
        
        
         
        // 변수명을 만들어서 가져와야한다
        let cunTrey: cuntrey = self.assets[indexPath.row]
        
        cell.cuntresLabel.text = cunTrey.korean_name
        // 컨트리 15번줄 에셋 -- 에셋은 코다블에서 가져온것 배열 확인  에셋네임 코리안네임 한글// 영어 확인 하는법
        if cunTrey.asset_name == "kr" {
            cell.cuntresImage.image = UIImage(named: "flag_kr")
        } else if cunTrey.asset_name == "de" {
            cell.cuntresImage.image = UIImage(named: "flag_de")
        } else if cunTrey.asset_name == "fr" {
            cell.cuntresImage.image = UIImage(named: "flag_fr")
        } else if cunTrey.asset_name == "it" {
            cell.cuntresImage.image = UIImage(named: "flag_it")
        } else if cunTrey.asset_name == "jp" {
            cell.cuntresImage.image = UIImage(named: "flag_jp")
        } else if cunTrey.asset_name == "us" {
            cell.cuntresImage.image = UIImage(named: "flag_us")
        }
        //if 비교대상 = 이거일때{
        //             조건이 충족될때 이걸실행한다}
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        // 에셋에 있는 파일명에 맞는 애들 불러오는것
        guard let nSDataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        // do문의 의미
        do {
            self.assets = try jsonDecoder.decode([cuntrey].self, from: nSDataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
                                                       //센더는
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        // 다음 뷰컨을 가져오고 원하는 내용을 보내줄수있다. 화면 넘기는
        guard let nextViewController: SeondViewController =
                segue.destination as? SeondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        
//        nextViewController.cityweather = self.cityweather?.cityTableViewCell
            //셀에 있는 내용 텍스트 다음 화면에 넘길때?
//        nextViewController.textToSet = cell.textLabel?.text
//        cell.cuntresLabel.text = .textToSet.weatherLabel
    }
}
