module NewslettersHelper
  def current_user_owns_newsletter?(newsletter)
    user_signed_in? and current_user.newsletters.include? newsletter
  end
end
