class PhoneNumber
  INVALID_NUMBER_PLACEHOLDER = '0000000000'

  attr_reader :number, :area_code

  def initialize(number)
    @number = if valid_number?(number)
                normalize_number(number)
              else
                INVALID_NUMBER_PLACEHOLDER
              end
    @area_code = extract_area_code(number)
  end

  def to_s
    number.gsub(/(.{3})(.{3})(.+)/, '(\1) \2-\3')
  end

  private

  def normalize_number(number)
    number
      .gsub(/\D/, '')
      .gsub(/^1([\d]{10})$/, '\1')
  end

  def valid_number?(number)
    return false if /^[\d\s\-().]+$/.match(number).nil?
    digits_count = number.gsub(/\D/, '').length
    digits_count == 10 || (digits_count == 11 && number[0] == '1')
  end

  def extract_area_code(number)
    number[0..2]
  end
end
