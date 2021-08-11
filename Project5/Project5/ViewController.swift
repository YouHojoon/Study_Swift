//
//  ViewController.swift
//  Project5
//
//  Created by 유호준 on 2021/08/11.
//

import UIKit

class ViewController: UITableViewController {
    var page = 1
 
    @IBOutlet var moreBtn: UIButton!
    //    var dataset = [
//        ("다크나이트","영웅물에 어쩌구","2020-08-14",8.96,"darknight.jpg"),
//        ("호우시절","비 어쩌구","2019-10-12",7.31,"rain.jpg"),
//        ("말할 수 있는 비밀","피아노 어쩌구","2015-05-06",9.19,"secret.jpg")
//
//    ]
    //lazy는 맨 마지막에 초기화하며 필요할 때 초기화된다 또한 lazy를 붙이지 않으면 다른 프로퍼티를 참조할 수 없다
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
//        for (title,desc,opendate,rating,thumbnail) in self.dataset{
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
    
    @IBAction func more(_ sender: Any) {
        self.page+=1
        self.callMovieApi()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택한 행은 \(indexPath.row)")
    }
    //몇개의 행이 있는지
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    //ViewCell이 어떻게 내용을 표시하여야 하는지
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell

//        cell.textLabel?.text = row.title
//        cell.detailTextLabel?.text = row.description
        
        /*
            커스텀 셀
         */
        
//        let title = cell.viewWithTag(101) as? UILabel
//        let opendate = cell.viewWithTag(102) as? UILabel
//        let desc = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
//
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
        
        /*
            커스텀 클래스
         */
        
        
        cell.title?.text = row.title
        cell.opendate?.text = row.opendate
        cell.desc?.text = row.description
        cell.rating?.text = "\(row.rating!)"
        
        //비동기방식으로 효율 향상
        DispatchQueue.main.async {
            cell.thumbnail?.image = self.getThumbnailImage(indexPath.row)
        }
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callMovieApi()
       
    }

    func callMovieApi() {
        let url = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=\(self.page)&version=1&genreId=&order=releasedateasc"
        
        let apiURI = URL(string: url)
        let apidata = try! Data(contentsOf: apiURI!)
        
        do{
            let apiDict = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDict["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            let totalCount = (hoppin["totalCount"] as! NSString).integerValue
            
            for row in movie{
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                
                list.append(mvo)
                
                if(self.list.count >= totalCount){
                    self.moreBtn.isHidden = true
                }
            }
        }catch{
            NSLog("Parse Error")
        }
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = list[index]
        
        if let savedImage = mvo.thunmbnailImage{
            return savedImage
        }else{
            let url: URL! = URL(string:mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            
            mvo.thunmbnailImage = UIImage(data: imageData)
            
            return mvo.thunmbnailImage!
        }
    }
}

extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail"{
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
        }
    }
}
