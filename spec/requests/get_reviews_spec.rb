require 'rails_helper'

describe "get all reviews route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @review = Review.create({author: 'Jo', content: 'wow, what a lovely place', rating: 5, destination_id: @destination.id})
    get "/destinations/#{@destination.id}/reviews"
  end

  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end