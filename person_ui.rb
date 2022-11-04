class PersonUserInterface
  attr_reader :people

  def initialize
    @people = []
    @path = 'data/person.json'
    @people_length = 0
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    @num = gets.chomp
    case @num
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter correct number'
    end
  end

  def list_all_people
    if @people.count.zero?
      puts ''
      puts 'There are no people yet try to create one !'
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts ''
  end

  def save_people_data
    return unless @people.length > @people_length

    if File.exist?(@path)
      if File.empty?(@path)
        save_people
      else
        append_people
      end
    else
      save_people
    end
  end

  def retrieved_people_data_from_file
    return unless File.exist?(@path) && !File.empty?(@path)

    retrieved_data = JSON.parse(File.read(@path))
    retrieved_data.each do |person|
      @people << if person['type'] == 'Student'
                   Student.new(person['age'], person['name'], person['permission'])
                 else
                   Teacher.new(person['age'], person['name'], person['specialization'])
                 end
    end
    @people_length = @people.length
  end

  private

  def save_people
    people_data = []
    @people.each do |person|
      people_data << if person.class.to_s == 'Student'
                       { type: person.class.to_s, name: person.name.to_s, id: person.id.to_s, age: person.age.to_s,
                         permission: person.parent_permission }
                     else
                       { type: person.class.to_s, name: person.name.to_s, id: person.id.to_s, age: person.age.to_s,
                         specialization: person.specialization.to_s }
                     end
    end
    File.write(@path, JSON.generate(people_data))
  end

  def append_people
    retrieved_data = JSON.parse(File.read(@path))
    @people.each_with_index do |person, index|
      next unless index > @people_length - 1

      retrieved_data << if person.class.to_s == 'Student'
                          { type: person.class.to_s, name: person.name.to_s, id: person.id.to_s, age: person.age.to_s,
                            permission: person.parent_permission.to_s }
                        else
                          { type: person.class.to_s, name: person.name.to_s, id: person.id.to_s, age: person.age.to_s,
                            specialization: person.specialization.to_s }
                        end
    end
    File.write(@path, JSON.generate(retrieved_data))
  end

  def age_input
    print 'Age: '
    gets.chomp
  end

  def name_input
    print 'Name: '
    gets.chomp
  end

  def permission_input
    print 'Has parent_permission ? [Y/N]: '
    @permission = gets.chomp

    @permission = false if @permission == 'n'
    @permission = true if @permission == 'y'
  end

  def specialization_input
    print 'Specialization: '
    gets.chomp
  end

  def create_student
    age = age_input

    name = name_input

    permission = permission_input

    @people << Student.new(age, name, permission)

    puts 'Person created successfully'
    puts ''
  end

  def create_teacher
    age = age_input

    name = name_input

    specialization = specialization_input

    @people << Teacher.new(age, name, specialization)

    puts 'Person successfully created'
    puts ''
  end
end
