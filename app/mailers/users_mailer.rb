# frozen_string_literal: true

class UsersMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'users_mailer'

  # def confirmation_instructions(record, token, opts={})
  #   super
  # end

  # def email_changed(record, token, opts={})
  #   super
  # end

  # def password_change(record, token, opts={})
  #   super
  # end

  # def reset_password_instructions(record, token, opts={})
  #   super
  # end

  # def unlock_instructions(record, token, opts={})
  #   super
  # end
end
