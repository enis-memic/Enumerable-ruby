# Create a class MyList that has an instance variable @list.

require_relative 'my_enumerable'

class MyList
  def initialize(*list)
    @list = list
  end

  include MyEnumerable

  def each
    @list.each { |n| yield n if block_given? }
  end
end

list = MyList.new(1, 2, 3, 4)

puts(list.all? { |e| e < 5 }) #=> true
puts(list.all? { |e| e > 5 }) #=> false

puts(list.any? { |e| e == 2 }) #=> true
puts(list.any? { |e| e == 5 }) #=> false

puts list.filter(&:even?) #=> [2, 4]
