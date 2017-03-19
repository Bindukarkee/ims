class UnitsController < ApplicationController


  def new
    @unit = Unit.new
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @unit = Unit.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit= Unit.find(params[:id])
    @unit.update(unit_param)
    @log = Log.create(description: "Updated Unit: " + @unit.name, user: current_user)
    redirect_to @unit
  end

  def destroy
    @unit = Unit.destroy(params[:id])
    @log = Log.create(description: "Deleted Unit: " + @unit.name, user: current_user)
    redirect_to @unit
  end


  def create
    @unit = Unit.new(unit_param)
    if @unit.save
      @log = Log.create(description: "Created Unit: " + @unit.name, user: current_user)
      redirect_to @unit
    else
      render 'new'
    end

  end


  private
  def unit_param
    params.require(:unit).permit(:name, :print_name)
  end
end
