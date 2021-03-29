require 'rails_helper'

describe "update a destination route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    put "/destinations/#{@destination.id}", params: { :country => 'updated_country', :state => 'updated_state', :city => 'updated_city' }
  end

  it 'updates the destination country' do
    expect(Destination.find(@destination.id).country).to eq('updated_country')
  end

  it 'updates the destination state' do
    expect(Destination.find(@destination.id).state).to eq('updated_state')
  end

  it 'updates the destination city' do
    expect(Destination.find(@destination.id).city).to eq('updated_city')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This destination has been updated successfully.")
  end
end