class Api::ListsController < ApiController

  before_action :authenticated?

  def index
    lists = current_user.lists
    render json: lists
  end

  def show
    list = current_user.lists.find(params[:id])
    render json: list
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def create
    list = List.new(list_params)

    if list.save
      render json: list
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    list = current_user.lists.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def destroy
    begin
      list = current_user.lists.find(params[:id])
      if list.destroy
        render json: {}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end

end