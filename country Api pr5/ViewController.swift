import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate{
    
    
    var arr : [WelcomeElement] = []
    var arr2 : [WelcomeElement] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var countryData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func getData(){
        let url = URL(string: "https://restcountries.com/v3.1/all")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: ur) { [self] data, response, error in
            do{
                if error == nil{
                    self.arr = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                    print(self.arr)
                    arr2 = arr
                    DispatchQueue.main.async {
                        self.countryData.reloadData()
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryData.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.label1.text = arr[indexPath.row].name.common
        cell.label2.text = arr[indexPath.row].name.official
        cell.img.image = stringToImg(link: arr[indexPath.row].flags.png)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func stringToImg(link : String) -> UIImage?{
        let url1 = URL(string: link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)!
    }
    //    func stringToImg2(link2 : String) -> UIImage?{
    //        let url2 = URL(string: link2)
    //        let data2 = try? Data(contentsOf: url2! as URL)
    //        return UIImage(data: data2!)
    //    }
    func navigation(number:String,name:String,photo:UIImage,population:Int,photo2:UIImage){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        //            navigate.a = name
        navigate.a = number
        navigate.b = photo
        navigate.c = population
        navigate.d = photo2
        navigationController?.pushViewController(navigate, animated: true)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation(number: arr[indexPath.row].name.common, name: arr[indexPath.row].name.official, photo: stringToImg(link: arr[indexPath.row].flags.png)!,population :arr[indexPath.row].population, photo2: stringToImg(link: arr[indexPath.row].coatOfArms.png ?? "")!)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""{
            arr = arr2
        }
        else{
            arr = arr2.filter({ a in
                a.name.common.contains(searchBar.text!)
            })
        }
        countryData.reloadData()
    }
    
}

