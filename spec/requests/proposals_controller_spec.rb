require 'rails_helper'

RSpec.describe "ProposalsControllers", type: :request do
  describe "GET /api/v1/proposals" do
    context 'when API key is missing' do
      it 'redirects the request' do
        get '/api/v1/proposals'
        expect(response).to have_http_status(:forbidden)
      end
    end
    context 'when API key is invalid' do
      it 'redirects the request' do
        api_user = ApiUser.create!(name:'Test Key', api_key: 'aaaaaaaaaaaaaa')
        get '/api/v1/proposals', headers: { 'agora-api-key': 'bbbbbbbbbbbbbb' }
        expect(response).to have_http_status(:forbidden)
      end
    end
    context 'when API key is valid' do
      it 'redirects the request' do
        api_user = ApiUser.create!(name:'Test Key', api_key: '121212121212')
        get '/api/v1/proposals', headers: { 'agora-api-key': api_user.api_key }
        expect(response).to have_http_status(:ok) 
      end
    end
  end
end
