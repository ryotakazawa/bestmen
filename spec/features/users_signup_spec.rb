# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UsersSignup', type: :feature do
  include SupportModule

  describe 'signup' do
    before { visit new_user_registration_path }
    it_behaves_like 'signup-form have right css'

    context 'valid info' do
      it_behaves_like 'success create user'
    end

    context 'invalid info (all blank)' do
      it_behaves_like 'fail create user all blank'
    end
    
    context 'invalid info (name blank)' do
      it_behaves_like 'fail create user name blank'
    end
    
    context 'invalid info (email blank)' do
      it_behaves_like 'fail create user email blank'
    end
    
    context 'invalid info (password blank)' do
      it_behaves_like 'fail create user password blank'
    end
    
    context 'invalid info (password confirmation blank)' do
      it_behaves_like 'fail create user password blank'
    end
    
    context 'invalid info (unmatch password)' do
      it_behaves_like 'fail create user unmatch password'
    end
    
    context 'invalid info (not unique email)' do
      it_behaves_like 'fail create user not unique email'
    end
  end
end
