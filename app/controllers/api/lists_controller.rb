class Api::ListsController < ApiController

  include ActiveModel::Validations

  before_action :authenticated?

  validates :name, presence: true

  def create
    list = List.new(list_params)

    if list.save
      render json: list
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  def list_params
    params.require(:list).permit(:name, :permissions)
  end

end