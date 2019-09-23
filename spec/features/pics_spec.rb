# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'PicsCreate', type: :feature do
  include SupportModule
  include_context 'setup'
  

  describe 'create' do
    before do
      login_as(user)
      visit new_pic_path
    end

    context 'new_pic-form have right css' do
      it_behaves_like 'new_pic-form have right css'
    end

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

  describe 'edit' do
    before do
      login_as(user)
      visit edit_pic_path(pic)
    end

    context 'new_pic-form have right css' do
      it_behaves_like 'edit_pic-form have right css'
    end

    context 'success edit pic' do
      it_behaves_like 'success edit pic'
    end

    context 'fail edit pic (name blank)' do
      it_behaves_like 'fail edit pic name blank'
    end

    context 'fail edit pic (tag_list blank)' do
      it_behaves_like 'fail edit pic tag_list blank'
    end
  end

  describe 'delete' do
    before do
      login_as(user)
      visit pic_path(pic)
    end

    context 'success delete pic' do
      it_behaves_like 'success delete pic'
    end
  end
end
