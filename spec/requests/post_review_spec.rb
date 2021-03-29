require 'rails_helper'

describe "post a review route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    post "/destinations/#{@destination.id}/reviews", params: { :author => 'Jo', :content => 'wow, what a lovely place', :rating => 5 }
  end

  it 'returns author of review' do
    expect(JSON.parse(response.body)['author']).to eq('Jo')
  end

  it 'returns content of review' do
    expect(JSON.parse(response.body)['content']).to eq('wow, what a lovely place')
  end

  it 'returns rating of review' do
    expect(JSON.parse(response.body)['rating']).to eq(5)
  end
end