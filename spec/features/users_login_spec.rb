# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UsersLogin', type: :feature do
  include SupportModule

  scenario 'login' do
    before { visit new_user_registration_path }
    it_behaves_like 'signup-form have right css'

    context 'valid info' do
      it_behaves_like 'success create user'
    end

    context 'invalid info' do
      it_behaves_like 'fail create user'
    end
  end
end
