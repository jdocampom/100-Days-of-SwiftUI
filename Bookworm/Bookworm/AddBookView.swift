//
//  AddBookView.swift
//  Bookworm
//
//  Created by Juan Diego Ocampo on 16/12/21.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 0
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var didPassInputValidation: Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty || author.trimmingCharacters(in: .whitespaces).isEmpty || genre.trimmingCharacters(in: .whitespaces).isEmpty || rating == 0 {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rate the Book")) {
                    HStack {
                        Spacer()
                        RatingView(rating: $rating)
                            .font(.title)
                        Spacer()
                    }
                }
                Section(header: Text("Book Details")) {
                    TextField("Name", text: $title)
                    TextField("Author", text: $author)
                    HStack {
                        Text("Genre")
                        Spacer()
                        Picker("Genre", selection: $genre) {
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                }
                Section(header: Text("Write a Review")) {
                    ZStack(alignment: .leading) {
                        if review.isEmpty { Text("Write your review here...").opacity(0.25) }
                        TextEditor(text: $review)
                    }
                }
            }
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading : Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    let newBook = Book(context: moc)
                    newBook.id = UUID()
                    newBook.title = title
                    newBook.author = author
                    newBook.rating = Int16(rating)
                    newBook.review = review
                    newBook.genre = genre
                    newBook.date = Date()
                    try? moc.save()
                    dismiss()
                }.disabled(didPassInputValidation == false))
        }
    }
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
