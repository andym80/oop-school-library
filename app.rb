require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './person'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = SaveFiles.load_books
    @people = SaveFiles.load_people
    @rentals = SaveFiles.load_rentals
  end

  def list_books
    @books.each do |book|
      p "Title: #{book.title}, Author: #{book.author}"
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
      p "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
    student = Student.new(age, name, parent_permission)
    @people.push(student)
    p 'Person created successfully'
  end

  def create_teacher
    p 'Age:'
    age = gets.chomp
    p 'Name:'
    name = gets.chomp
    p 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    p 'Person created successfully'
  end

  def create_rental
    p 'ID of the person:'
    person_id = gets.chomp
    p 'ID of the book:'
    book_id = gets.chomp
    p 'Date:'
    date = gets.chomp
    rental = Rental.new(date, book_id, person_id)
    @rentals.push(rental)
    p 'Rental created successfully'
  end

  def list_rentals
    p 'ID of the person:'
    id = gets.chomp
    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
