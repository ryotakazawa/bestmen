# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'PicsCreate', type: :feature do
  include SupportModule
  include_context "setup"
  
  before do
    login_as(user)
    visit new_pic_path
  end

  describe 'create' do
    it_behaves_like 'new_pic-form have right css'
    
    context 'valid info' do
      it_behaves_like 'success create pic'
    end

    context 'fail create pic (name blank)' do
      it_behaves_like 'fail create pic name blank'
    end
    
    context 'fail create pic (tag_list blank)' do
      it_behaves_like 'fail create pic tag_list blank'
    end
  end
end
