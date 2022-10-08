require_relative './MyEnumerable'
class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end
list = MyList.new(1, 2, 3, 4)
# test all_method
p(list.all? { |e| e < 5 })
# true
p(list.all? { |e| e > 5 })
# false
p(list.any? { |e| e == 2 })
# true
p(list.any? { |e| e == 5 })
# false
p(list.filter(&:even?))
# [2, 4]
