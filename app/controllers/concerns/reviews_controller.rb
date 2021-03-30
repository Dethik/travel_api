class ReviewsController < ApplicationController
  swagger_controller :reviews, "Travel Destination Reviews"

  swagger_api :index do
    summary "Fetches all reviews for a specific destination"
    notes "This lists all the travel destinations"
    param :path, :destination_id, :integer, :required, "Destination Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    destination = Destination.find(params[:destination_id])
    @reviews = destination.reviews
    json_response(@reviews)
  end

  swagger_api :show do
    summary "Fetches a single review for a destination"
    param :path, :destination_id, :integer, :required, "Destination Id"
    param :path, :id, :integer, :required, "Review Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  def show
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.destination_id == @destination.id
      json_response(@review)
    else
      render status: 404, json: {
        message: "A review with that id does not match the destination id."
      }
    end
  end

  swagger_api :create do
    summary "Creates a new Review"
    param :form, :author, :string, :required, "Author"
    param :form, :content, :string, :required, "Content"
    param :form, :rating, :integer, :required, "Rating, 1-5"
    response :ok, "Your review has been added successfully."
    response :unauthorized
    response :not_acceptable
  end
  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  swagger_api :update do
    summary "Updates an existing review"
    param :path, :destination_id, :integer, :required, "Destination Id"
    param :path, :id, :integer, :required, "Review Id"
    param :form, :author, :string, :optional, "Author"
    param :form, :content, :string, :optional, "Content"
    param :form, :rating, :integer, :optional, "Rating, 1-5"
    response :ok, "This review has been updated successfully."
    response :unauthorized
    response :not_found
    response :not_acceptable
  end
  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "This review has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing review"
    param :path, :destination_id, :integer, :required, "Destination Id"
    param :path, :id, :integer, :required, "Review Id"
    response :ok, "This review has been deleted successfully."
    response :unauthorized
    response :not_found
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: "This review has been deleted successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:author, :content, :rating, :destination_id)
  end

end