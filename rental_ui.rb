class RentalUserInterface
  def initialize
    @rentals = []
    @path = 'data/rentals.json'
  end

  def create_rental(books, people)
    book_num = get_book_from_user(books)

    person_num = get_person_from_user(people)

    date = date_input

    @rentals << Rental.new(books[book_num.to_i], people[person_num.to_i], date)
    puts 'Rental created successfully'
    puts ''
  end

  def list_all_rental_by_id
    print 'ID of person: '
    id = gets.chomp

    filtred_rentals = @rentals.select { |rental| rental.person.id == id.to_i }
    filtred_rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  private

  def date_input
    puts 'Date: '
    gets.chomp
  end

  def get_book_from_user(books)
    if books.count.zero?
      puts 'Please try to create book first and try again !'
    else
      puts 'Select a book from the following list by number'
      books.each_with_index do |book, index|
        puts "#{index})Title: #{book.title}, Author: #{book.author}"
      end
    end
    gets.chomp
  end

  def get_person_from_user(people)
    if people.count.zero?
      puts 'Please try to create PERSON first and try again !'
    else
      puts 'Select a person from the following list by number (not id)'
      people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    gets.chomp
  end
end
