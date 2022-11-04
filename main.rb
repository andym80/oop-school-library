require_relative './app'

def main
  app = App.new
  exit_button = true
  puts '\nWelcome to School Library App!'
  while exit_button
    options = [
      '',
      '[1] - List all books',
      '[2] - List all people',
      '[3] - Create a person',
      '[4] - Create a book',
      '[5] - Create a rental',
      '[6] - List all rentals for a given person id',
      '[7] - Exit',
      ''
    ]
    puts '_____________________________________________'
    puts "Please choose an option by entering a number:\n"
    puts options
    print 'Answer: '
    choice = gets.chomp
    case choice
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals
    when '7'
      puts 'Thank you for using this app!'
      exit_button = false
    else
      puts 'That is not a valid option'
    end
  end
end
main

def list_books
  if @books.empty?
    puts 'There are no books in the library'
  else
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end

def create_book
  p 'Title:'
  title = gets.chomp
  p 'Author:'
  author = gets.chomp
  book = Book.new(title, author)
  @books.push(book)
  p 'Book created successfully'
end

def list_people
  @people.each do |person|
    p "[#{person.class}]Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person
  p 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
  person_type = gets.chomp
  case person_type
  when '1'
    create_student
  when '2'
    create_teacher
  else
    p 'Invalid option'
  end
end

def create_student
  p 'Age:'
  age = gets.chomp
  p 'Name:'
  name = gets.chomp
  p 'Has parent permission? [Y/N]'
  parent_permission = gets.chomp
  parent_permission = parent_permission.casecmp('y').zero?
  student = Student.new(parent_permission, age, name)
  @people.push(student)
  p 'Person created successfully'
end

def create_teacher
  p 'Age:'
  age = gets.chomp.to_i
  p 'Name:'
  name = gets.chomp.capitalize
  p 'Specialization:'
  specialization = gets.chomp.capitalize
  teacher = Teacher.new(age, name, specialization)
  @people.push(teacher)
  p 'Person created successfully'
end

def create_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index do |book, index|
    puts "#{index}) #{book} Title: #{book.title}, Author: #{book.author}"
  end
  puts 'Select a person from the following list by number (not id)'
  puts '========================================================================'
  @people.each_with_index do |person, index|
    puts "#{index}) #{person} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  p 'ID of the person:'
  person_id = gets.chomp.to_i
  p 'ID of the book:'
  book_id = gets.chomp.to_i
  p 'Date:'
  date = gets.chomp
  rental = Rental.new(date, @books[book_id], @people[person_id])
  @rentals.push(rental)
  p 'Rental created successfully'
end

def list_rentals
  p 'ID of the person:'
  id = gets.chomp.to_i
  rentals = @rentals.filter { |rental| rental.person.id == id }
  puts 'Rentals:'
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  end
end
