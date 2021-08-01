# frozen_string_literal: true

module SlotsHelper
  # def current_user_owns_slot?(slot)
  #   user_signed_in? and slot.newsletter.user.eql?(current_user)
  # end

  def generate_mailto_string(newsletter, slot)
    user_email = newsletter.user.email
    slot_date_formatted = slot.publish_date.strftime('%d %B, %Y')
    slot_type = slot.slot_type.name

    subject_line = ERB::Util.url_encode(slot.slot_type.email_template_subject.to_s)
    body_text = ERB::Util.url_encode(
      "--- \n" +
      "Slot Date: #{slot_date_formatted} \n" +
      "Slot Type: #{slot_type} \n" +
      "---" +
      "\n" +
      slot.slot_type.email_template_body
    )

    # subject_line = "Sponsorship Enquiry"
    # body_text = "This is a sponsorship enquiry."

    "mailto:#{user_email}?subject=#{subject_line}&body=#{body_text}"
  end

  def generate_booked_string(slot)
    if slot.booked
      'Yes'
    else
      'No'
    end
  end

  def days_until_or_after_published_string(slot)
    if slot.days_until_published.positive?
      "In #{pluralize(slot.days_until_published, 'day')}"
    elsif slot.days_until_published.negative?
      "#{pluralize(-slot.days_until_published, 'day')} ago"
    else
      'Today!'
    end
  end
end
