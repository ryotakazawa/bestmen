# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PicsController, type: :controller do
  include SupportModule
  include_context 'setup'

  context 'Delete' do
    before do
      login_as(user)
    end

    it 'success delete user' do
      expect do
        delete :destroy, params: { id: pic }
      end.to change(Pic, :count).by(0)
    end

    it 'doesnt accept delete request from uncorrect user' do
      pic = create(:pic, user_id: 2)
      expect do
        delete :destroy, params: { id: pic.id }
      end.to change(Pic, :count).by(0)
    end
  end
end
