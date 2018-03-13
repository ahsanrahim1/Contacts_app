class Contact < ApplicationRecord

  def friendly_updated_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  def full_name
    first_name + " " + last_name
  end
  def as_json
    {
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number:phume_number,
      updated_at: friendly_updated_at
    }
  end
end
