module HomeHelper
  def this_year
    today = Date.today
    return today.strftime('%Y').to_s
  end
end
