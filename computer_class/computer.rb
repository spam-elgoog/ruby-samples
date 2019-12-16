# frozen_string_literal: true

# This is just a simple sample Computer class, using optional options via
# hashes for listing files that were created.
class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{@username} created the file \"#{filename}\" at #{time}  ."
  end

  # method with optional parameter
  def list_files(show_time: false)
    @files.each do |key, value|
      time = ", #{value}" if show_time
      puts "#{key.ljust(30, ' ')}#{time}"
    end
  end

  def self.users
    @@users
  end
end

my_computer = Computer.new 'Peter Studnicka', 'mario'

# add some files into the collection
my_computer.create 'my.txt'
my_computer.create 'collections.rb'

# list files without time
my_computer.list_files
# list files with the timestamp
my_computer.list_files show_time: true
