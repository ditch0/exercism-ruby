class Crypto
  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @message.gsub(/\W+/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    plaintext_segments_chars.map(&:join)
  end

  def plaintext_segments_chars
    normalize_plaintext
      .chars
      .each_slice(size)
      .to_a
  end

  def ciphertext_segments
    (0...size).collect do |i|
      plaintext_segments_chars.map { |chars| chars[i] }.reject(&:nil?).join
    end
  end

  def ciphertext
    ciphertext_segments.join
  end

  def normalize_ciphertext
    ciphertext_segments.join(' ')
  end
end
