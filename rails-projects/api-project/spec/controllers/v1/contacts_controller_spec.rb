# # frozen_string_literal: true

# require 'rails_helper'
# RSpec.describe V1::ContactsController do
#   describe 'GET #index' do
#     let!(:contacts) { FactoryBot.create_list(:random_contacts, 3) }
#     before do      
#       get :index
#     end
#     it 'returns http success' do
#       expect(response).to have_http_status(:success)
#     end
#     it 'JSON body response contains expected recipe attributes' do
#       json_response = JSON.parse(response.body)
#       expect(json_response['data']).to eq([])
#       puts "!!!! json_response['data'] #{json_response['data']}"
#       expect(json_response['status']).to eq(200)
#     end
#   end
# end
