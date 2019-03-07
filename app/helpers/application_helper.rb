module ApplicationHelper

  def human_date(date)
    date.strftime("%d %b %Y")
  end

  def human_date_time(date)
    date.strftime("%d %b %Y %H:%M:%S")
  end
end
