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
    32
  end

  def self.generate_seo_name (id, name)
    "#{id}-#{name.parameterize}"
  end
end