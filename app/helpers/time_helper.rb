module TimeHelper
  def short_time (time)
    now = Time.new

    if time.to_date === now.to_date # sometime today, but not in the future!
      diff = (now - time).to_i

      if diff < 60 # within the last minute
        'just seconds ago'
      elsif diff < 3600 # within the last hour
        pluralize(diff / 60, 'minutes') + ' ago'
      else # since midnight
        'today at ' + (time.strftime '%l:%M %P')
      end
    elsif (time.to_date + 1) === now.to_date # sometime yesterday
      'yesterday at ' + (time.strftime '%l:%M %P')
    else # anytime before yesterday
      time.strftime 'on %B %e, %Y at %l:%M %P'
    end
  end
end
