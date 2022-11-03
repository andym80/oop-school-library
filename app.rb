require_relative './book.rb'
require_relative './rental.rb'
require_relative './person.rb'
require_relative './student.rb'
require_relative './teacher.rb'
require_relative './decorator_capitalize.rb'
require_relative './decorator_trimmer.rb'

class App
  attr_reader :books, :people, :rentals

  def initialize()
    @books = SaveFiles.load_books
    @people = SaveFiles.load_people
    @rentals = SaveFiles.load_rentals
  end

  def run
    p 'Welcome to School Library App!'
    loop do
	  p 'Please choose an option by entering a number:'
	  p '1 - List all books'
	  p '2 - List all people'
	  p '3 - Create a person'
	  p '4 - Create a book'
	  p '5 - Create a rental'
	  p '6 - List all rentals for a given person id'
	  p '7 - Exit'
	  option = gets.chomp
	  case option
	  when '1'
		list_books
	  when '2'
		list_people
	  when '3'
		create_person
	  when '4'
		create_book
	  when '5'
		create_rental
	  when '6'
		list_rentals
	  when '7'
		p 'Thank you for using this app!'
		break
	  else
		p 'That is not a valid option'
	  end
	end
  end

      # List all books

      get '/books' do
        @books = Book.all
        erb :books
      end

      # List all people

      get '/people' do
        @people = Person.all
        erb :people
        if @people.empty?
          p 'There are no people created'
          @people.each do |person|
            p "Type: #{person.class}, Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
          end
        else
          p 'There are no books created'
          @books.each do |book|
            p "Title: #{book.title}, Author: #{book.author}"
		  end

# Create a person (POST /people)

post '/people' do
  @person = Person.new(params[:name], params[:age], params[:parent_permission])
  p 'method called'
  is_permitted = params[:parent_permission].casecmp('y').zero?
  @person = if is_permitted
              Student.new(params[:name], params[:age], params[:parent_permission])
            else
              Teacher.new(params[:name], params[:age], params[:parent_permission])
			  			end
  @person.save
  redirect '/people'
  @people = person
end

# Create a new book (POST /books)

post '/books' do
  @book = Book.new(params[:title], params[:author])
  @book.save
  redirect '/books'
end

# Create a new rental (POST /rentals)

post '/rentals' do
  @rental = Rental.new(params[:date], params[:book], params[:person])
  @rental.save
  redirect '/rentals'
end

# List all rentals for a given person id

get '/rentals/:id' do
  @rentals = Rental.find_by_person_id(params[:id])
  erb :rentals
end
