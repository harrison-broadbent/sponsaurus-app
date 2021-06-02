module SlotsHelper
  def current_user_owns_slot?(slot)
    user_signed_in? and slot.newsletter.user.eql?(current_user)
  end
end
