import XCTest
@testable import stdstr

class stdstrTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_size() {
        let str = "Test string"
        XCTAssert(str.size() == 11)
    }
    
    func test_length() {
        let str = "Test string"
        XCTAssert(str.length() == 11)
    }
    
    func test_resize() {
        var str = "I like to code in C"
        let sz = str.size()
        
        str.resize(sz + 2, "+")
        XCTAssert(str == "I like to code in C++")
        
        str.resize(sz, "*")
        XCTAssert(str == "I like to code in C")
        
        str.resize(14)
        XCTAssert(str == "I like to code")
        
        str.resize(14, "!")
        XCTAssert(str == "I like to code")
    }
    
    func test_clear() {
        var str = "hotdog"
        str.clear()
        XCTAssert(str == "")
    }
    
    func test_empty() {
        var str = "pizza"
        XCTAssert(str.empty() == false)
        
        str.clear()
        XCTAssert(str.empty() == true)
    }
    
    func test_subscript() {
        var str = "sausage"
        XCTAssert(str[2] == "u")
        
        str[0] = "S"
        XCTAssert(str == "Sausage")
    }
    
    func test_at() {
        let str = "fries"
        XCTAssert(str.at(2) == "i")
    }
    
    func test_append() {
        var str = ""
        let str2 = "Writing "
        let str3 = "print 10 and then 5 more"
        
        str.append(str2)
        XCTAssert(str == "Writing ")
        
        str.append(str3, 6, 3)
        XCTAssert(str == "Writing 10 ")
        
        str.append("dots are cool", 5)
        XCTAssert(str == "Writing 10 dots ")
        
        str.append(10, ".")
        XCTAssert(str == "Writing 10 dots ..........")
    }
    
    func test_push_back() {
        var str = "cat"
        str.push_back("s")
        XCTAssert(str == "cats")
    }
    
    func test_assign() {
        let base = "The quick brown fox jumps over a lazy dog."
        var str = ""
        
        str.assign(base)
        XCTAssert(str == base)
        
        str.assign(base, 10, 9)
        XCTAssert(str == "brown fox")
        
        str.assign("pangrams are cool", 7)
        XCTAssert(str == "pangram")
        
        str.assign(10, "*")
        XCTAssert(str == "**********")
    }
    
    func test_insert() {
        var str = "to be question"
        let str2 = "the "
        let str3 = "or not to be"
        
        str.insert(6, str2)
        XCTAssert(str == "to be the question")
        
        str.insert(6, str3, 3, 4)
        XCTAssert(str == "to be not the question")
        
        str.insert(10, "that is cool", 8)
        XCTAssert(str == "to be not that is the question")
        
        str.insert(10, "to be ")
        XCTAssert(str == "to be not to be that is the question")
        
        str.insert(15, 1, ":")
        XCTAssert(str == "to be not to be: that is the question")
        
        let it = str.insert(str.begin().advancedBy(5), ",")
        XCTAssert(str == "to be, not to be: that is the question")
        XCTAssert(str[it] == ",")
        
        str.insert(str.end(), 3, ".")
        XCTAssert(str == "to be, not to be: that is the question...")
    }
    
    func test_erase() {
        var str = "This is an example sentence."
        
        str.erase(10, 8)
        XCTAssert(str == "This is an sentence.")
        
        let it1 = str.erase(str.begin().advancedBy(9))
        XCTAssert(str == "This is a sentence.")
        XCTAssert(str[it1] == " ")
        
        let it2 = str.erase(str.begin().advancedBy(5), str.end().advancedBy(-9))
        XCTAssert(str == "This sentence.")
        XCTAssert(str[it2] == "s")
    }
    
    func test_replace() {
        let base = "this is a test string."
        let str2 = "n example"
        let str3 = "sample phrase"
        
        var str = base
        
        str.replace(9, 5, str2)
        XCTAssert(str == "this is an example string.")
        
        str.replace(19, 6, str3, 7, 6)
        XCTAssert(str == "this is an example phrase.")
        
        str.replace(8, 10, "just a")
        XCTAssert(str == "this is just a phrase.")
        
        str.replace(8, 6, "a shorty", 7)
        XCTAssert(str == "this is a short phrase.")
        
        str.replace(22, 1, 3, "!")
        XCTAssert(str == "this is a short phrase!!!")
        
        str.replace(10, String.npos, "hotdog.")
        XCTAssert(str == "this is a hotdog.")
    }
    
    func test_swap() {
        var buyer = "money"
        var seller = "goods"
        
        buyer.swap(&seller)
        XCTAssert(buyer == "goods")
        XCTAssert(seller == "money")
    }
    
    func test_copy() {
        var buffer = ""
        let str = "Test string..."
        var length = 0
        
        length = str.copy(&buffer, 6, 5)
        XCTAssert(buffer == "string")
        XCTAssert(length == 6)
        
        length = str.copy(&buffer, String.npos, 0)
        XCTAssert(buffer == str)
        XCTAssert(length == 14)
    }
    
    func test_find() {
        var str = "There are two needles in this haystack with needles."
        let str2 = "needle"
        var found = String.npos
        
        found = str.find(str2)
        XCTAssert(found == 14)
        
        found = str.find("needles are small", found + 1, 6)
        XCTAssert(found == 44)
        
        found = str.find(Character("."))
        XCTAssert(found == 51)
        
        str.replace(str.find(str2), str2.length(), "preposition")
        XCTAssert(str == "There are two prepositions in this haystack with needles.")
        
        found = str.find(Character("T"))
        XCTAssert(found == 0)
    }
    
    func test_rfind() {
        var str = "The sixth sick sheik's sixth sheep's sick."
        let key = "sixth"
        var found = 0
        
        found = str.rfind(key)
        XCTAssert(found != String.npos)
        
        str.replace(found, key.length(), "seventh")
        XCTAssert(str == "The sixth sick sheik's seventh sheep's sick.")
        
        found = str.rfind("sick.")
        XCTAssert(found != String.npos)
        
        found = str.rfind(Character("T"))
        XCTAssert(found == 0)
    }
    
    func test_substr() {
        let str = "We think in generalities, but we live in details."
        
        XCTAssert(str.substr(3, 5) == "think")
        XCTAssert(str.substr(str.find("live")) == "live in details.")
    }
    
    func test_find_first_of() {
        let vowels = "aeiou"
        var str = "Please, replace the vowels in this sentence by asterisks."
        var found = str.find_first_of(vowels)
        while found != String.npos {
            str[found] = "*"
            found = str.find_first_of(vowels, found + 1)
        }
        XCTAssert(str == "Pl**s*, r*pl*c* th* v*w*ls *n th*s s*nt*nc* by *st*r*sks.")
    }
    
    func test_find_last_of() {
        let path1 = "/usr/bin/man"
        let path2 = "C:\\windows\\winhelp.exe"
        let delimiters = "/\\"
        var found = String.npos
        
        found = path1.find_last_of(delimiters)
        XCTAssert(found != String.npos)
        XCTAssert(path1.substr(found + 1) == "man")
        
        found = path2.find_last_of(delimiters)
        XCTAssert(found != String.npos)
        XCTAssert(path2.substr(found + 1) == "winhelp.exe")
    }
    
    func test_find_first_not_of() {
        let str = "look for non-alphabetic characters..."
        let found = str.find_first_not_of("abcdefghijklmnopqrstuvwxyz ")
        XCTAssert(found == 12)
    }
    
    func test_find_last_not_of() {
        var str = "Please, erase trailing white-spaces    \n"
        let whitespaces = " \t\n\r"
        
        let found = str.find_last_not_of(whitespaces)
        XCTAssert(found != String.npos)
        XCTAssert(str.erase(found + 1) == "Please, erase trailing white-spaces")
    }
}
