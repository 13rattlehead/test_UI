import Foundation
extension UserDefaults {
    func setValueForCount(value: Int){
        if value != nil {
            UserDefaults.standard.set(value, forKey: "Count_Number")
        } else {
            UserDefaults.standard.removeObject(forKey: "Count_Number")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getValueOfCount() -> Int? {
        return UserDefaults.standard.value(forKey: "Count_Number") as? Int
    }
}
