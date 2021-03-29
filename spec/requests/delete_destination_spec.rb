require 'rails_helper'

describe "update a destination route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @destination2 = FactoryBot.create(:destination)
  end

  it 'deletes destination' do
    delete "/destinations/#{@destination.id}"
    expect(JSON.parse(response.body)['message']).to eq("This destination has been deleted successfully.")
  end

  it 'deletes a destination' do
    delete "/destinations/#{@destination.id}"
    get "/destinations"
    expect(JSON.parse(response.body)).to eq([YAML.load(@destination2.to_json)])
  end
end