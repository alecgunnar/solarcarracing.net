module SEO
  def self.word_sep
    '-'
  end

  def self.valid_chars
    'a-z0-9' + word_sep
  end

  def self.valid_chars_pattern
    /[#{valid_chars}]+/
  end

  def self.invalid_chars
    '^' + valid_chars
  end

  def self.invalid_chars_pattern
    /[#{invalid_chars}]+/
  end

  def self.max_name_length
    64
  end

  def self.generate_seo_name (id, name)
    id.to_s + name.downcase.split.join(SEO_NAME_WORD_SEP).gsub(/#{valid_chars}/).squeeze('-')[0, max_name_length]
  end
end