class Bob
  def hey(remark)
    if yell?(remark)
      'Whoa, chill out!'
    elsif question?(remark)
      'Sure.'
    elsif silence?(remark)
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end

  private

  def yell?(remark)
    remark.match(/[a-z]/).nil? && !remark.match(/[A-Z]/).nil?
  end

  def question?(remark)
    remark[-1] == '?'
  end

  def silence?(remark)
    !remark.match(/\A\s*\z/).nil?
  end
end
