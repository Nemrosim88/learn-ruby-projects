# frozen_string_literal: true

require 'rails_helper'
require 'json'

# http://timjwade.com/2016/08/01/testing-json-apis-with-rspec-composable-matchers.html
# https://relishapp.com/rspec/rspec-expectations/v/3-8/docs
RSpec.describe V1::RolesController do
  describe 'GET #index' do
    let!(:roles) { FactoryBot.create_list(:random_roles, 3) }

    before do
      get :index, format: :json
    end

    it 'should returns http status -> success/200' do
      expect(response.status).to eq(200)
    end

    it 'should return JSON as an array' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_instance_of(Array)
    end

    it 'should return JSON array with 3 objects in it' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(3)
    end

    it 'should return JSON onjects with expected attributes' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response[0].keys).to match_array(%w[alias created_at id name updated_at])
    end

    it 'should return JSON onjects with expected data types' do
      expected = a_collection_including(
        a_hash_including('alias' => kind_of(String)),
        a_hash_including('created_at' => kind_of(String)),
        a_hash_including('id' => kind_of(Integer)),
        a_hash_including('name' => kind_of(String)),
        a_hash_including('updated_at' => kind_of(String))
      )

      # in version 5.0.0.beta3 Rails added a method to the response object
      expect(response.parsed_body).to match(expected)
    end
  end
end
