# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  include SupportModule
  include_context "setup"

  describe 'CreateComment' do
    
    before do
      login_as(user)
      visit pic_path(pic)
    end
    
    it_behaves_like 'comment-form have right css'
    
  end
end
