//
//  User.swift
//  Alamoofile
//
//  Created by 은영김 on 2020/02/21.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import Foundation

let jsonData = """
[
{
name: "Cristea",
surname: "Răzvan",
gender: "male",
region: "Romania",
age: 22,
title: "mr",
phone: "(966) 720 1392",
birthday: {
dmy: "27/11/1998",
mdy: "11/27/1998",
raw: 912151226
},
email: "cristea-98@example.com",
password: "Răzvan98$+",
credit_card: {
expiration: "11/24",
number: "1644-2215-4905-4361",
pin: 1532,
security: 257
},
photo: "https://uinames.com/api/photos/male/3.jpg"
},
{
name: "Δήμος",
surname: "Αλαφούζος",
gender: "male",
region: "Greece",
age: 33,
title: "mr",
phone: "(657) 516 3330",
birthday: {
dmy: "24/03/1987",
mdy: "03/24/1987",
raw: 543582660
},
email: "Δήμος_87@example.com",
password: "Αλαφούζος87+^",
credit_card: {
expiration: "4/27",
number: "4901-6430-5327-2875",
pin: 8738,
security: 730
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Selena",
surname: "Martin",
gender: "female",
region: "Canada",
age: 28,
title: "ms",
phone: "(827) 323 4674",
birthday: {
dmy: "16/04/1992",
mdy: "04/16/1992",
raw: 703458340
},
email: "selena_92@example.com",
password: "Martin92=",
credit_card: {
expiration: "2/25",
number: "2267-8414-7449-3177",
pin: 2775,
security: 421
},
photo: "https://uinames.com/api/photos/female/16.jpg"
},
{
name: "Mateusz",
surname: "Szewczyk",
gender: "male",
region: "Poland",
age: 25,
title: "mr",
phone: "(736) 869 5467",
birthday: {
dmy: "10/04/1995",
mdy: "04/10/1995",
raw: 797561183
},
email: "mateusz_95@example.com",
password: "Szewczyk95(#",
credit_card: {
expiration: "2/25",
number: "2147-5693-6965-9090",
pin: 6863,
security: 928
},
photo: "https://uinames.com/api/photos/male/20.jpg"
},
{
name: "Alfie",
surname: "Williams",
gender: "male",
region: "England",
age: 36,
title: "mr",
phone: "(640) 393 4318",
birthday: {
dmy: "21/08/1984",
mdy: "08/21/1984",
raw: 461981900
},
email: "alfie84@example.com",
password: "Williams84^{",
credit_card: {
expiration: "9/24",
number: "8163-2166-1500-3599",
pin: 3063,
security: 100
},
photo: "https://uinames.com/api/photos/male/1.jpg"
},
{
name: "Sidhant",
surname: "Rayamajhee",
gender: "male",
region: "Nepal",
age: 27,
title: "mr",
phone: "(360) 698 6997",
birthday: {
dmy: "05/06/1993",
mdy: "06/05/1993",
raw: 739300786
},
email: "sidhant_93@example.com",
password: "Rayamajhee93=}",
credit_card: {
expiration: "10/23",
number: "2074-1635-9587-1099",
pin: 5409,
security: 602
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "邓",
surname: "腾",
gender: "male",
region: "China",
age: 28,
title: "mr",
phone: "(342) 781 9455",
birthday: {
dmy: "03/12/1992",
mdy: "12/03/1992",
raw: 723426084
},
email: "邓.腾@example.com",
password: "腾92^)",
credit_card: {
expiration: "11/27",
number: "8715-7230-6369-5971",
pin: 3618,
security: 883
},
photo: "https://uinames.com/api/photos/male/18.jpg"
},
{
name: "Ricardo",
surname: "Velázquez",
gender: "male",
region: "Mexico",
age: 35,
title: "mr",
phone: "(910) 933 4224",
birthday: {
dmy: "23/06/1985",
mdy: "06/23/1985",
raw: 488417304
},
email: "ricardo_85@example.com",
password: "Velázquez85#~",
credit_card: {
expiration: "10/24",
number: "8010-4651-3606-9299",
pin: 7532,
security: 954
},
photo: "https://uinames.com/api/photos/male/1.jpg"
},
{
name: "Ελλάδιος",
surname: "Αλαβάνος",
gender: "male",
region: "Greece",
age: 35,
title: "mr",
phone: "(288) 953 8077",
birthday: {
dmy: "11/07/1985",
mdy: "07/11/1985",
raw: 489931031
},
email: "Ελλάδιος-85@example.com",
password: "Αλαβάνος85*=",
credit_card: {
expiration: "1/28",
number: "6441-2315-9374-3137",
pin: 1939,
security: 512
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Sergej",
surname: "Šulc",
gender: "male",
region: "Slovakia",
age: 31,
title: "mr",
phone: "(910) 264 4436",
birthday: {
dmy: "26/06/1989",
mdy: "06/26/1989",
raw: 614868054
},
email: "sergej_Šulc@example.com",
password: "Šulc89(+",
credit_card: {
expiration: "5/21",
number: "9435-6972-9638-6814",
pin: 3017,
security: 428
},
photo: "https://uinames.com/api/photos/male/3.jpg"
},
{
name: "Nicolae",
surname: "Mușat",
gender: "male",
region: "Romania",
age: 34,
title: "mr",
phone: "(341) 832 9261",
birthday: {
dmy: "22/12/1986",
mdy: "12/22/1986",
raw: 535671059
},
email: "nicolae_86@example.com",
password: "Mușat86}{",
credit_card: {
expiration: "6/21",
number: "9171-9786-2657-8976",
pin: 9881,
security: 873
},
photo: "https://uinames.com/api/photos/male/2.jpg"
},
{
name: "Jay",
surname: "Patel",
gender: "male",
region: "England",
age: 36,
title: "mr",
phone: "(118) 716 8500",
birthday: {
dmy: "04/09/1984",
mdy: "09/04/1984",
raw: 463174141
},
email: "jay.patel@example.com",
password: "Patel84@#",
credit_card: {
expiration: "3/24",
number: "9021-4679-6038-6651",
pin: 2458,
security: 842
},
photo: "https://uinames.com/api/photos/male/18.jpg"
},
{
name: "Ισαάκιος",
surname: "Πυλαρινός",
gender: "male",
region: "Greece",
age: 31,
title: "mr",
phone: "(791) 550 5421",
birthday: {
dmy: "02/06/1989",
mdy: "06/02/1989",
raw: 612770739
},
email: "Ισαάκιος_89@example.com",
password: "Πυλαρινός89{)",
credit_card: {
expiration: "7/24",
number: "6820-4996-9345-9461",
pin: 6437,
security: 893
},
photo: "https://uinames.com/api/photos/male/7.jpg"
},
{
name: "Hayden",
surname: "Voss",
gender: "male",
region: "New Zealand",
age: 31,
title: "mr",
phone: "(323) 914 2908",
birthday: {
dmy: "15/03/1989",
mdy: "03/15/1989",
raw: 605999199
},
email: "hayden_voss@example.com",
password: "Voss89+}",
credit_card: {
expiration: "2/25",
number: "7523-9787-6407-3255",
pin: 2322,
security: 286
},
photo: "https://uinames.com/api/photos/male/4.jpg"
},
{
name: "魏",
surname: "言",
gender: "male",
region: "China",
age: 24,
title: "mr",
phone: "(848) 564 8854",
birthday: {
dmy: "07/04/1996",
mdy: "04/07/1996",
raw: 828908267
},
email: "魏_言@example.com",
password: "言96+(",
credit_card: {
expiration: "11/25",
number: "1636-3179-3084-6164",
pin: 2250,
security: 780
},
photo: "https://uinames.com/api/photos/male/12.jpg"
},
{
name: "Δαμιανός",
surname: "Γούσιος",
gender: "male",
region: "Greece",
age: 28,
title: "mr",
phone: "(503) 609 2184",
birthday: {
dmy: "01/03/1992",
mdy: "03/01/1992",
raw: 699441258
},
email: "Δαμιανός_92@example.com",
password: "Γούσιος92%_",
credit_card: {
expiration: "4/27",
number: "4851-5299-3587-2166",
pin: 3309,
security: 812
},
photo: "https://uinames.com/api/photos/male/6.jpg"
},
{
name: "Sarah",
surname: "Vasquez",
gender: "female",
region: "United States",
age: 34,
title: "ms",
phone: "(946) 463 3595",
birthday: {
dmy: "30/10/1986",
mdy: "10/30/1986",
raw: 531054572
},
email: "sarah-86@example.com",
password: "Vasquez86~~",
credit_card: {
expiration: "8/24",
number: "6850-9282-6445-1841",
pin: 5064,
security: 863
},
photo: "https://uinames.com/api/photos/female/18.jpg"
},
{
name: "Jack",
surname: "Dean",
gender: "male",
region: "United States",
age: 34,
title: "mr",
phone: "(266) 221 9061",
birthday: {
dmy: "27/09/1986",
mdy: "09/27/1986",
raw: 528245857
},
email: "jackdean@example.com",
password: "Dean86_)",
credit_card: {
expiration: "10/24",
number: "4969-9947-2540-5543",
pin: 4717,
security: 351
},
photo: "https://uinames.com/api/photos/male/14.jpg"
},
{
name: "Csalogány",
surname: "Hanna",
gender: "female",
region: "Hungary",
age: 22,
title: "ms",
phone: "(587) 458 6360",
birthday: {
dmy: "15/08/1998",
mdy: "08/15/1998",
raw: 903199734
},
email: "csalogány98@example.com",
password: "Hanna98$(",
credit_card: {
expiration: "12/21",
number: "3812-8944-7913-6377",
pin: 7171,
security: 192
},
photo: "https://uinames.com/api/photos/female/5.jpg"
},
{
name: "Daniel",
surname: "Haas",
gender: "male",
region: "Germany",
age: 29,
title: "mr",
phone: "(379) 371 2030",
birthday: {
dmy: "29/04/1991",
mdy: "04/29/1991",
raw: 672911164
},
email: "daniel_haas@example.com",
password: "Haas91$(",
credit_card: {
expiration: "12/26",
number: "5694-6598-5746-9304",
pin: 3216,
security: 553
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Ευμένης",
surname: "Βαμβακάς",
gender: "male",
region: "Greece",
age: 30,
title: "mr",
phone: "(339) 575 4651",
birthday: {
dmy: "28/09/1990",
mdy: "09/28/1990",
raw: 654517461
},
email: "Ευμένης_90@example.com",
password: "Βαμβακάς90_+",
credit_card: {
expiration: "6/27",
number: "7586-5568-2921-1556",
pin: 1328,
security: 920
},
photo: "https://uinames.com/api/photos/male/16.jpg"
},
{
name: "Ashim",
surname: "Oli",
gender: "male",
region: "Nepal",
age: 28,
title: "mr",
phone: "(188) 980 7471",
birthday: {
dmy: "29/06/1992",
mdy: "06/29/1992",
raw: 709790752
},
email: "ashim-oli@example.com",
password: "Oli92&%",
credit_card: {
expiration: "7/26",
number: "7707-1072-2017-3216",
pin: 4438,
security: 903
},
photo: "https://uinames.com/api/photos/male/19.jpg"
},
{
name: "Bajro",
surname: "Kusturica",
gender: "male",
region: "Bosnia and Herzegovina",
age: 26,
title: "mr",
phone: "(166) 634 8914",
birthday: {
dmy: "08/11/1994",
mdy: "11/08/1994",
raw: 784306832
},
email: "bajro94@example.com",
password: "Kusturica94@~",
credit_card: {
expiration: "3/24",
number: "6543-8321-9194-9630",
pin: 1653,
security: 511
},
photo: "https://uinames.com/api/photos/male/10.jpg"
},
{
name: "魏",
surname: "永",
gender: "male",
region: "China",
age: 36,
title: "mr",
phone: "(211) 352 3900",
birthday: {
dmy: "10/06/1984",
mdy: "06/10/1984",
raw: 455695131
},
email: "魏永@example.com",
password: "永84*",
credit_card: {
expiration: "2/22",
number: "7441-2330-8975-4495",
pin: 8756,
security: 383
},
photo: "https://uinames.com/api/photos/male/14.jpg"
}
]
""".data(using: .utf8)!

let jsonDataTest = """
{
  "name": "Alina",
  "surname": "Grecescu",
  "gender": "female",
  "region": "Romania",
  "age": 34,
  "title": "ms",
  "phone": "(748) 937 8858",
  "birthday": {
    "dmy": "07/09/1986",
    "mdy": "09/07/1986",
    "raw": 526451656
  },
  "email": "alina_86@example.com",
  "password": "Grecescu86&^",
  "credit_card": {
    "expiration": "3/25",
    "number": "5745-8712-3746-6978",
    "pin": 4405,
    "security": 183
  },
  "photo": "https://uinames.com/api/photos/female/16.jpg"
}
""".data(using: .utf8)!

let decoder = JSONDecoder()


// MARK: Struct

struct CreditCard: Decodable {
  let expiration: String
  let number: String
  let pin: Int
  let security: Int
  
//    private enum CodingKeys: String, CodingKey {
//      case expiration
//      case number
//      case pin
//      case security
//    }
//
//    init(from decoder: Decoder) throws {
//    let values = try decoder.container(keyedBy: CodingKeys.self)
//      self.expiration = try values.decode(String.self, forKey: .expiration)
//      self.number = try values.decode(String.self, forKey: .number)
//      self.pin = try values.decode(Int.self, forKey: .pin)
//      self.security = try values.decode(Int.self, forKey: .security)
//    }
}

struct User: Decodable {
  let fullName: String
  let phone: String
  let birthDay: Date
  let email: String
  let creditCard: CreditCard
  let photo: String
  
  private enum CodingKeys: String, CodingKey {
    case name, surname, phone, birthday, email, photo
    case creditCard = "credit_card"
  }
  
  private enum BirthdayKeys: String, CodingKey {
  case dmy, mdy, raw
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let surname = try container.decode(String.self, forKey: .surname)
    let name = try container.decode(String.self, forKey: .name)
    self.fullName = surname + name
//  let values = try decoder.container(keyedBy: CodingKeys.self)
//    self.fullName = try values.decode(String.self, forKey: .fullName)
    
    self.phone = try container.decode(String.self, forKey: .phone)
    self.email = try container.decode(String.self, forKey: .email)
    self.creditCard = try container.decode(CreditCard.self, forKey: .creditCard)
    self.photo = try container.decode(String.self, forKey: .photo)
    
    let birthdayContainer = try container.nestedContainer(
      keyedBy: BirthdayKeys.self,
      forKey: .birthday
    )
    let raw = try birthdayContainer.decode(Double.self, forKey: .raw)
    self.birthDay = Date(timeIntervalSince1970: raw)
  }
}

//do {
//  let user = try decoder.decode(User.self, from: jsonDataTest)
//print(user)
//
//} catch {
//  print(error)
//  }


