//
//  Double+.swift
//  Caculator
//
//  Created by datNguyem on 19/09/2021.
//

import Foundation

extension Double {
    func formatResult() -> String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
