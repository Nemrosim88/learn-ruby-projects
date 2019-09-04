# frozen_string_literal: true

require 'test_helper'

class V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: 'sports')
  end

  test 'route test' do
    assert_generates '/v1/categories',
                     controller: 'v1/categories',
                     action: 'index'
    assert_generates '/v1/categories/1',
                     controller: 'v1/categories',
                     action: 'show',
                     id: '1'
    assert_generates '/v1/categories',
                     controller: 'v1/categories',
                     action: 'create'
  end

  test 'should get categories index' do
    get '/v1/categories'
    assert_response :success
  end

  test 'should create new' do
    post '/v1/categories'
    assert_response :success
  end

  test 'should get show' do
    get "/v1/categories/#{@category.id}"
    assert_response :success
  end
end
