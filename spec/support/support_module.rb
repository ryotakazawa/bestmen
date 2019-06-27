# frozen_string_literal: true

module SupportModule
  def fill_in_signup_form(user, option = { invalid: false })
    if option[:invalid]
      fill_in 'Name',         with: ''
      fill_in 'Email',        with: ''
      fill_in 'Password',     with: ''
      fill_in 'Confirmation', with: ''
    else
      params = attributes_for(user) # => ファクトリ使用、属性値をハッシュとして作成
      fill_in 'Name',         with: params[:name]
      fill_in 'Email',        with: params[:email]
      fill_in 'Password',     with: params[:password]
      fill_in 'Confirmation', with: params[:password]
    end
  end
end
