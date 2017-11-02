//
//  ViewController.swift
//  norikae
//
//  Created by Kobayashi Yako on 2017/11/01.
//  Copyright © 2017年 Step App School. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet var WebView: UIWebView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //UserDefaultsを生成
        let ud = UserDefaults.standard
        //保存したキーワードを読み込む
        searchBar.text = ud.string(forKey: "SearchKey")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let datetime = General.getNowDateAndTime(); //GeneralのgetNowDateAndTimeを使う
        let year = datetime.0 //年
        let month = datetime.1 //月
        let day = datetime.2 //日
        let hour = datetime.3 //時
        let min = datetime.4 //分
        
        //乗換案内検索用のURLを作る
        let urlString = String(format:
            "https://transit.yahoo.co.jp/search/result?flatlon=&from=門前仲町&to=%@&hb=1&lb=1&al=1&sr=1&ym=%d%02d&d=%d&hh=%d&m1=%d&m2=%d&type=1&ws=2&s=0&expkind=1&ticket=ic&datepicker=&kw=%@&x=95&y=18"
            ,searchBar.text!, year,month,day,hour,min / 10,min % 10,searchBar.text!)
        
        //作ったURLをWebViewに渡して表示してもらう
        let urlRequest = General.urlToRequest(urlString)
        if(urlRequest != nil) {
            WebView.loadRequest(urlRequest! as URLRequest) //WebViewで表示する
            
            //UserDefaultを生成
            let ud = UserDefaults.standard
            //入力されたキーワードを保存する
            ud.set(searchBar.text!, forKey: "SearchKey")
            ud.synchronize()
        }
        searchBar.resignFirstResponder() //キーボードを消す
    }
}

