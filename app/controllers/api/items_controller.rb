class Api::ItemsController < ApiController

  before_action :authenticated?

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
    item = Item.find(params[:id])
    list = item.list
    if item.update(item_params) && list.user == current_user
      render json: item
    else
      render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    list = item.list
    if item.destroy && list.user == current_user
      render json: {}, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :complete)
  end

end
