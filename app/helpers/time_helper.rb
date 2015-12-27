module TimeHelper
  def short_time (time)
    now = Time.new

    if time.to_date === now.to_date
      diff = (now - time).to_i

      if diff < 60
        'just seconds ago'
      elsif diff < 3600
        (diff / 60).to_s + ' minutes ago'
      else
        'today at ' + (time.strftime '%l:%M %P')
      end
    elsif (time.to_date + 1) === now.to_date
      'yesterday at ' + (time.strftime '%l:%M %P')
    else
      time.strftime 'on %B %e, %Y at %l:%M %P'
    end
  end
end
