# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  #describe 'GET #top' do
    #it 'returns http success' do
      #get root_path
      #expect(response).to have_http_status(:success)
    #end
  #end

  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
end
