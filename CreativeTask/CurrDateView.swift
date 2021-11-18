//
//  CurrDateView.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

struct CurrDateView: View {
    
    private let today = Date()
    private let dateFormatter = DateFormatter()

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(getDay())
            Text(getMonth() + getDate())
                .font(.largeTitle).minimumScaleFactor(0.5)
            Text(getYear())
                .font(.title)
                .foregroundColor(.gray)
        }
    }
    
    // lets get the date components so we can use them with different fonts and scales
    
    private func getDay() -> String {
        
        var currDay : String
        dateFormatter.dateFormat = "eeee"
        currDay = dateFormatter.string(from: today)
        
        return currDay
        
    }
    
    private func getMonth() -> String {
        
        var currMonth : String
        dateFormatter.dateFormat = "MMM, "
        currMonth = dateFormatter.string(from: today)
        
        return currMonth
    }
    
    private func getDate() -> String {
        
        var currDate : String
        dateFormatter.dateFormat = "d"
        currDate = dateFormatter.string(from: today)
        
        return currDate
    }
    
    private func getYear() -> String {
        
        var currYear : String
        dateFormatter.dateFormat = "y"
        currYear = dateFormatter.string(from: today)
        
        return currYear
    }

    
}

struct CurrDateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrDateView()
    }
}
