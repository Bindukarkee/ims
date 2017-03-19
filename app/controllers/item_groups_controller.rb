
class ItemGroupsController < ApplicationController

	def new
    @item_group =ItemGroup.new
  end

  def show
    @item_group = ItemGroup.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @item_group = ItemGroup.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @item_group = ItemGroup.find(params[:id])
  end

  def update
    @item_group= ItemGroup.find(params[:id])
    @item_group.update(item_group_param)
    @log = Log.create(description: "Updated Item Group: " + @item_group.name, user: current_user)
    redirect_to @item_group
  end

  def destroy
    @item_group = ItemGroup.destroy(params[:id])
    @log = Log.create(description: "Deleted Item Group: " + @item_group.name, user: current_user)
    redirect_to @item_group
  end


  def create
    @item_group = ItemGroup.new(item_group_param)
    if @item_group.save
      @log = Log.create(description: "Created Item Group: " + @item_group.name, user: current_user)
      redirect_to @item_group
    else
      render 'new'
    end
  end


  private
  def item_group_param
    params.require(:item_group).permit(:name, :parent_id)
  end
end

