class DestinationsController < ApplicationController
  swagger_controller :destinations, "Travel Destinations"

  swagger_api :index do
    summary "Fetches all destinations(search optional)"
    notes "This lists all the travel destinations(for search to work correctly, params must be lowercase only)"
    param :query, :country, :string, :optional, "country"
    param :query, :state, :string, :optional, "state"
    param :query, :city, :string, :optional, "city"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def index
    @destinations = Destination.all
    @destinations = @destinations.by_country(params[:country]) if params[:country].present?
    @destinations = @destinations.by_state(params[:state]) if params[:state].present?
    @destinations = @destinations.by_city(params[:city]) if params[:city].present?
    json_response(@destinations)
  end

  swagger_api :show do
    summary "Fetches a single destination"
    param :path, :id, :integer, :required, "Destination Id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  swagger_api :create do
    summary "Creates a new destination"
    param :form, :country, :string, :required, "Country"
    param :form, :state, :string, :optional
    param :form, :city, :string, :required, "City"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @destination = Destination.create!(destination_params)
    json_response(@destination, :created)
  end

  swagger_api :update do
    summary "Updates an existing Destination"
    param :path, :id, :integer, :required, "Destination Id"
    param :form, :country, :string, :optional, "Country"
    param :form, :state, :string, :optional, "State"
    param :form, :city, :string, :optional, "City"
    response :ok, "This destination has been updated successfully."
    response :not_found
    response :unprocessable_entity, "Validation failed: Country can't be blank, City can't be blank"
  end
  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "This destination has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing destination"
    param :path, :id, :integer, :optional, "User Id"
    response :ok, "This destination has been deleted successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy!
      render status: 200, json: {
        message: "This destination has been deleted successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def destination_params
    params.permit(:country, :state, :city)
  end

end