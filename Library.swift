//
//  Library.swift
//
//
//  Created by Daniel Hoang on 6/23/14.
//
//

import Foundation

class Book {
    // starts off without a shelf
    var shelfSitting = -1
    var currentIndex = -1
    var currentIndexUnshelved = -1
    var libraryName: Library
    var title: String
    init(libraryName: Library, title: String) {
        //this book belongs to libraryName.
        self.libraryName = libraryName
        self.title = title
        libraryName.unshelvedBooks.append(self)
        currentIndexUnshelved = libraryName.numUnshelved++
    }
    //enshelf:
    //post: book now placed on given shelf number.
    func enshelf(shelfNum: Int) {
        shelfSitting = shelfNum
        //inserted at index size-1.
        libraryName.shelves[shelfNum].books.append(self)
        
        //increment numBooks after saving the book's currentIndex:
        currentIndex = libraryName.shelves[shelfNum].numBooks++
        
        //also must remove book from unshelved list:
        libraryName.unshelvedBooks.removeAtIndex(currentIndexUnshelved)
        currentIndexUnshelved = -1
        libraryName.numUnshelved--
    }
    
    //unshelf:
    //pre: book is on a shelf (shelfSitting has value)
    //post: shelfSitting no longer that value.
    func unshelf(shelfNum: Int) {
        libraryName.shelves[shelfNum].books.removeAtIndex(currentIndex)
        currentIndex = -1
        shelfSitting = -1
        libraryName.shelves[shelfNum].numBooks--
        
        //also must add to unshelved list:
        libraryName.unshelvedBooks.append(self)
        currentIndexUnshelved = libraryName.numUnshelved++
    }
}

class Shelf {
    var libraryName: Library
    init(libraryName: Library) {
        //this shelf belongs to libraryName.
        self.libraryName = libraryName
    }
    let bookCapacity = 10
    var numBooks = 0
    var books: Book[] = []
}

class Library {
    //specify number of shelves
    init(numShelves: Int) {
        var i = 0;
        while ( i < numShelves) {
            var shelf1 = Shelf(libraryName:self)
            addShelf(shelf1)
            ++i
        }
    }
    var shelves: Shelf[] = []
    var unshelvedBooks: Book[] = []
    var numUnshelved = 0
    func addShelf(newShelf: Shelf) {
        shelves.append(newShelf)
    }
    func reportAllBooks() {
        //start with books that are in a shelf
        for eachShelf in shelves {
            
        }
        //include books not in shelf:
    }
    //include a non-shelf
    
}
