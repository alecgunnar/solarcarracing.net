module TimeHelper
  def short_time (time)
    now   = Time.new
    today = now.to_date

    the_day = time.to_date

    if the_day === today # sometime today, but not in the future!
      diff = (now - time).to_i

      if diff < 60 # within the last minute
        'just seconds ago'
      elsif diff < 3600 # within the last hour
        pluralize(diff / 60, 'minute') + ' ago'
      else # since midnight
        'today at ' + (time.strftime '%l:%M %P')
      end
    elsif (the_day + 1) === today # sometime yesterday
      'yesterday at ' + (time.strftime '%l:%M %P')
    elsif today - 7 <  the_day # sometime within the last week
      time.strftime 'on %A at %l:%M %P'
    else # anytime before yesterday
      time.strftime 'on %B %e, %Y at %l:%M %P'
    end
  end
end
