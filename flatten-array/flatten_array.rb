module FlattenArray
  VERSION = 1

  def self.flatten(array)
    [].tap do |flat_array|
      array.each do |e|
        if e.nil?
          next
        elsif e.is_a?(Array)
          flat_array += flatten(e)
        else
          flat_array << e
        end
      end
    end
  end
end
