//
//  General.swift
//
//  Created by matsumoto keiji on 2017/05/29.
//  Copyright © 2017年 matsumoto keiji. All rights reserved.
//

import Foundation

struct General {
	//現在の日時を整数で取得する
	static func getNowDateAndTime() -> (Int,Int,Int,Int,Int) {
		let now = Date()
		let cal = Calendar.current
		let dataComps = cal.dateComponents([.year, .month, .day, .hour, .minute], from: now)
		return (dataComps.year!,dataComps.month!,dataComps.day!,dataComps.hour!,dataComps.minute!)
	}	

	//URLエンコード
	static func urlEncode(url:String) -> String? {
		return url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
	}

	
	//URLをRequestにする
	static func urlToRequest(_ urlString:String) -> NSURLRequest? {
		
		let encodedURL = General.urlEncode(url:urlString)
		if(encodedURL != nil) {
			let myUrl = NSURL(string: encodedURL!)
			
			return  NSURLRequest(url:myUrl! as URL)
		}
		return nil
	}

}

