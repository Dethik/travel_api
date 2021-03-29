require 'rails_helper'

describe "update a review route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @review = Review.create({ :author => 'Jo', :content => 'wow, what a lovely place', :rating => 5, :destination_id => @destination.id })
    put "/destinations/#{@destination.id}/reviews/#{@review.id}", params: { :author => 'Andy', :content => 'this place sucks', :rating => 1 }
  end

  it 'updates the author of a review' do
    expect(Review.find(@review.id).author).to eq('Andy')
  end

  it 'updates the content of a review' do
    expect(Review.find(@review.id).content).to eq('this place sucks')
  end

  it 'updates the rating of a review' do
    expect(Review.find(@review.id).rating).to eq(1)
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq('This review has been updated successfully.')
  end
end