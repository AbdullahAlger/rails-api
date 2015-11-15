class Api::ItemsController < ApiController

  before_action :authenticated?

  def index
    lists = current_user.lists.find(params[:list_id])
    items = lists.items
    render json: items
  end

  def show
    lists = current_user.lists.find(params[:list_id])
    items = lists.items.find(params[:id])
    render json: items
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def create
    list = current_user.lists.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item
    else
      render json: {errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    list = current_user.lists.find(params[:list_id])
    item = list.items.find(params[:id])
    #item = current_user.items.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  def destroy
    list = current_user.lists.find(params[:list_id])
    item = list.items.find(params[:id])
    if item.destroy
      render json: {}, status: :no_content
    end
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
  end

  private

  def item_params
    params.require(:item).permit(:description, :complete)
  end

end
