class Bst
  include Enumerable

  attr_accessor :data, :left, :right

  VERSION = 1

  def initialize(data)
    @data = data
  end

  def insert(new_data)
    target_attr = new_data <= @data ? '@left' : '@right'
    if instance_variable_get(target_attr).nil?
      instance_variable_set(target_attr, Bst.new(new_data))
    else
      instance_variable_get(target_attr).insert(new_data)
    end
  end

  def each(&block)
    if block_given?
      @left&.each(&block)
      yield data
      @right&.each(&block)
    else
      Enumerator.new(self, :each)
    end
  end
end
