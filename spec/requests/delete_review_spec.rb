require 'rails_helper'

describe "delete a review route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @review1 = Review.create({ :author => 'Jo', :content => 'wow, what a lovely place', :rating => 5, :destination_id => @destination.id })
    @review2 = Review.create({ :author => 'Andy', :content => 'wow, this place sucks', :rating => 1, :destination_id => @destination.id})
  end

  it 'deletes review' do
    delete "/destinations/#{@destination.id}/reviews/#{@review1.id}"
    expect(JSON.parse(response.body)['message']).to eq("This review has been deleted successfully.")
  end

  it 'deletes a review' do
    delete "/destinations/#{@destination.id}/reviews/#{@review1.id}"
    get "/destinations/#{@destination.id}/reviews"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end