class Api::ItemsController < ApiController

  before_action :authenticated?

  def index
    lists = current_user.lists.find(params[:list_id])
    items = lists.items
    render json: items
  end

  def show
    list = current_user.lists.find(params[:list_id])
    item = list.items.find(params[:id])
    render json: item
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item
    else
      render json: {errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    item = current_user.items.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def destroy
    item = current_user.items.find(params[:id])
    if item.destroy
      render json: {}, status: :not_found
    end
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  private

  def item_params
    params.require(:item).permit(:description, :complete)
  end

end
