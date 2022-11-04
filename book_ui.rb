require 'json'
class BookUserInterface
  attr_reader :books

  def initialize
    @books = []
    @books_length = 0
    @path = 'data/book.json'
  end

  def create_book
    title, author = book_details

    @books << Book.new(title, author)
    puts 'Book created successfully'
    puts ''
  end

  def list_all_books
    if books.count.zero?
      puts ''
      puts 'there are no books yet try to create one'
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    puts ''
  end

  def save_books_data
    return unless @books.length > @books_length

    if File.exist?(@path)
      if File.empty?(@path)
        save_books
      else
        append_books
      end
    else
      save_books
    end
  end

  def retrieved_books_data_from_file
    return unless File.exist?(@path) && !File.empty?(@path)

    retrieved_data = JSON.parse(File.read(@path))
    retrieved_data.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
    @books_length = @books.length
  end

  private

  def save_books
    books_data = []
    @books.each do |book|
      books_data << { title: book.title.to_s, author: book.author.to_s }
    end
    File.write(@path, JSON.generate(books_data))
  end

  def append_books
    retrieved_data = JSON.parse(File.read(@path))
    @books.each_with_index do |book, index|
      retrieved_data << { title: book.title.to_s, author: book.author.to_s } if index > @books_length - 1
    end
    File.write(@path, JSON.generate(retrieved_data))
  end

  def book_details
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end
end
