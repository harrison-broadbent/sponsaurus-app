module HomeHelper
  def  current_user_slots_path
    pretty_newsletter_slots_path(current_user.newsletters.first) if current_user && !current_user.newsletters.empty?
  end
end
