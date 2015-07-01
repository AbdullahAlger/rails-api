class Api::ItemsController < ApiController

  before_action :authenticated?

  def index
    list = List.find(params[:list_id])
    items = list.items
    render json: items
  end

  def show
    list = List.find(params[:list_id])
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
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:description, :complete)
  end

end
