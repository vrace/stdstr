//
//  stdstr.wift -- C++ 98 std::string port to Swift
//
//  Copyright (C) 2016 Liuyang
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source distribution.
//

import Foundation

extension String {
    static let npos: Int = Int.max
    
    func begin() -> Index {
        return startIndex
    }
    
    func end() -> Index {
        return endIndex
    }
    
    func size() -> Int {
        return length()
    }
    
    func length() -> Int {
        return characters.count
    }
    
    mutating func resize(n: Int) {
        self = substr(0, n)
    }
    
    mutating func resize(n: size_t, _ c: Character) {
        if length() >= n {
            self = substr(0, n)
        }
        else {
            append(n - length(), c)
        }
    }
    
    mutating func reserve(n: Int = 0) {
        reserveCapacity(n)
    }
    
    mutating func clear() {
        removeAll()
    }
    
    func empty() -> Bool {
        return isEmpty
    }
    
    subscript(pos: Int) -> Character {
        get {
            return at(pos)
        }
        set(newValue) {
            replace(pos, 1, String(newValue))
        }
    }
    
    func at(pos: Int) -> Character {
        return self[startIndex.advancedBy(pos)]
    }
    
    mutating func append(str: String) -> String {
        appendContentsOf(str)
        return self
    }
    
    mutating func append(str: String, _ subpos: Int, _ sublen: Int) -> String {
        return append(str.substr(subpos, sublen))
    }
    
    mutating func append(s: String, _ n: Int) -> String {
        return append(s.substr(0, n))
    }
    
    mutating func append(n: Int, _ c: Character) -> String {
        self.append(String(count: n, repeatedValue: c))
        return self
    }
    
    mutating func push_back(c: Character) {
        self.append(c)
    }
    
    mutating func assign(str: String) -> String {
        self = str
        return self
    }
    
    mutating func assign(str: String, _ subpos: Int, _ sublen: Int) -> String {
        return assign(str.substr(subpos, sublen))
    }
    
    mutating func assign(s: String, _ n: Int) -> String {
        return assign(s.substr(0, n))
    }
    
    mutating func assign(n: Int, _ c: Character) -> String {
        clear()
        return append(n, c)
    }
    
    mutating func insert(pos: Int, _ str: String) -> String {
        insertContentsOf(str.characters, at: startIndex.advancedBy(pos))
        return self
    }
    
    mutating func insert(pos: Int, _ str: String, _ subpos: Int, _ sublen: Int) -> String {
        return insert(pos, str.substr(subpos, sublen))
    }
    
    mutating func insert(pos: Int, _ s: String, _ n: Int) -> String {
        return insert(pos, s.substr(0, n))
    }
    
    mutating func insert(pos: Int, _ n: Int, _ c: Character) -> String {
        return insert(pos, String(count: n, repeatedValue: c))
    }
    
    mutating func insert(p: Index, _ n: Int, _ c: Character) {
        insertContentsOf(String(count: n, repeatedValue: c).characters, at: p)
    }
    
    mutating func insert(p: Index, _ c: Character) -> Index {
        let distance = begin().distanceTo(p)
        insert(c, atIndex: p)
        return begin().advancedBy(distance)
    }
    
    mutating func erase(pos: Int = 0, _ len: Int = String.npos) -> String {
        return replace(pos, len, String())
    }
    
    mutating func erase(p: Index) -> Index {
        let distance = begin().distanceTo(p)
        replaceRange(p ..< p.advancedBy(1), with: String())
        return begin().advancedBy(distance)
    }
    
    mutating func erase(first: Index, _ last: Index) -> Index {
        let distance = begin().distanceTo(first)
        replaceRange(first ..< last, with: String())
        return begin().advancedBy(distance)
    }
    
    mutating func replace(pos: Int, _ len: Int, _ str: String) -> String {
        let end = Int(min(UInt(pos) + UInt(len), UInt(length())))
        replaceRange(startIndex.advancedBy(pos) ..< startIndex.advancedBy(end), with: str)
        return self
    }
    
    mutating func replace(pos: Int, _ len: Int, _ str: String, _ subpos: Int, _ sublen: Int) -> String {
        return replace(pos, len, str.substr(subpos, sublen))
    }
    
    mutating func replace(pos: Int, _ len: Int, _ s: String, _ n: Int) -> String {
        return replace(pos, len, s.substr(0, n))
    }
    
    mutating func replace(pos: Int, _ len: Int, _ n: Int, _ c: Character) -> String {
        return replace(pos, len, String(count: n, repeatedValue: c))
    }
    
    mutating func swap(inout str: String) {
        let temp = self
        self = str
        str = temp
    }
    
    func copy(inout s: String, _ len: Int, _ pos: Int = 0) -> Int {
        s.assign(self, pos, len)
        return s.length()
    }
    
    func find(str: String, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            self.substr($0, str.length()) == str
        }
    }
    
    func find(s: String, _ pos: Int, _ n: Int) -> Int {
        return find(s.substr(0, n), pos)
    }
    
    func find(c: Character, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            self.at($0) == c
        }
    }
    
    func rfind(str: String, _ pos: Int = String.npos) -> Int {
        return iterateBackward(pos) {
            self.substr($0, str.length()) == str
        }
    }
    
    func rfind(s: String, _ pos: Int, _ n: Int) -> Int {
        return rfind(s.substr(0, n), pos)
    }
    
    func rfind(c: Character, _ pos: Int = String.npos) -> Int {
        return iterateBackward(pos) {
            self.at($0) == c
        }
    }
    
    func find_first_of(str: String, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            str.find(self.at($0)) != String.npos
        }
    }
    
    func find_first_of(s: String, _ pos: Int, _ n: Int) -> Int {
        return find_first_of(s.substr(0, n), pos)
    }
    
    func find_first_of(c: Character, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            self.at($0) == c
        }
    }
    
    func find_last_of(str: String, _ pos: Int = String.npos) -> Int {
        return iterateBackward(pos) {
            str.find(self.at($0)) != String.npos
        }
    }
    
    func find_last_of(s: String, _ pos: Int, _ n: Int) -> Int {
        return find_last_of(s.substr(0, n), pos)
    }
    
    func find_last_of(c: Character, _ pos: Int = String.npos) -> Int {
        return iterateBackward(pos) {
            self.at($0) == c
        }
    }
    
    func find_first_not_of(str: String, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            str.find(self.at($0)) == String.npos
        }
    }
    
    func find_first_not_of(s: String, _ pos: Int, n: Int) -> Int {
        return find_first_not_of(s.substr(0, n), pos)
    }
    
    func find_first_not_of(c: Character, _ pos: Int = 0) -> Int {
        return iterateForward(pos) {
            self.at($0) != c
        }
    }
    
    func find_last_not_of(str: String, _ pos: Int = String.npos) -> Int {
        return iterateBackward(pos) {
            str.find(self.at($0)) == String.npos
        }
    }
    
    func find_last_not_of(s: String, _ pos: Int, n: Int) -> Int {
        return find_last_not_of(s.substr(0, n), pos)
    }
    
    func find_last_not_of(c: Character, _ pos: Int = 0) -> Int {
        return iterateBackward(pos) {
            self.at($0) != c
        }
    }
    
    func substr(pos: Int = 0, _ len: Int = String.npos) -> String {
        let end = Int(min(UInt(pos) + UInt(len), UInt(length())))
        return substringWithRange(startIndex.advancedBy(pos) ..< startIndex.advancedBy(end))
    }
    
    private func iterateForward(pos: Int, _ predicate: Int -> Bool) -> Int {
        for index in pos.stride(to: length(), by: 1) {
            if predicate(index) {
                return index
            }
        }
        return String.npos
    }
    
    private func iterateBackward(pos: Int, _ predicate: Int -> Bool) -> Int {
        for index in min(length() - 1, pos).stride(through: 0, by: -1) {
            if predicate(index) {
                return index
            }
        }
        return String.npos
    }
}

// Not implemented methods
//
// Iterators
// =========
// reverse_iterator rbegin();
// const_reverse_iterator rbegin() const;
// reverse_iterator rend();
// const reverse_iterator rend() const;
//
// Capacity
// ========
// size_t max_size() const;
// size_t capacity() const;
//
// Element access
// ==============
// char& at(size_t pos);
//
// Modifiers
// =========
// template <class InputIterator> string& append(InputIterator first, InputIterator last);
// template <class InputIterator> string& assign(InputIterator first, InputIterator last);
// template <class InputIterator> void insert(iterator p, InputIterator first, InputIterator last);
// string& replace(iterator i1, iterator i2, const string &str);
// string& replace(iterator i1, iterator i2, const char *s, size_t n);
// string& replace(iteratir i1, iterator i2, size_t n, char c);
// template <class InputIterator> string& replace(iterator i1, iterator i2, InputIterator first, InputIterator last);
//
// String operations
// =================
// const char* c_str() const;
// const char* data() const;
// allocator_type get_allocator() const;
// int compare(const string &str) const;
// int compare(size_t pos, size_t len, const string &str) const;
// int compare(size_t pos, size_t len, const string &str, size_t subpos, size_t sublen) const;
// int compare(const char *s) const;
// int compare(size_t pos, size_t len, const char *s) const;
// int compare(size_t pos, size_t len, const char *s, size_t n) const;
