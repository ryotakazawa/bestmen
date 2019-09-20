# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UsersLogin', type: :feature do
  include SupportModule
  include_context "setup"

  describe 'login' do
    before { visit new_user_session_path }
    it_behaves_like 'login-form have right css'

    context 'valid info' do
      it_behaves_like 'success login user'
    end
    
     context 'invalid info (all blank)' do
      it_behaves_like 'fail login user all blank'
    end
    
    context 'invalid info (email blank)' do
      it_behaves_like 'fail login user email blank'
    end
    
    context 'invalid info (password blank)' do
      it_behaves_like 'fail login user password blank'
    end
    
    context 'invalid info (unmatch password)' do
      it_behaves_like 'fail login user unmatch password'
    end
    
  end
end
