# frozen_string_literal: true

module RequestHelpers
  def is_logged_in?
    !session[:user_id].nil?
  end
end
