class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @supplier = Supplier.paginate(:page => params[:page], :per_page => 4)
  end

  def edit

    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier= Supplier.find(params[:id])
    @log = Log.create(description: "Updated Supplier Item: " + @supplier.name, user: current_user)
    @supplier.update(supplier_param)
    redirect_to @supplier
  end

  def destroy
    @supplier = Supplier.destroy(params[:id])
    @log = Log.create(description: "Deleted supplier Item: " + @supplier.name, user: current_user)
    redirect_to @supplier
  end


  def create
    @supplier = Supplier.new(supplier_param)
    if @supplier.save
      @log = Log.create(description: "Created supplier Item: " + @supplier.name, user: current_user)
      redirect_to @supplier
    else
      render 'new'
    end
  end

  private
  def supplier_param
    params.require(:supplier).permit(:name, :address, :phone_no, :email)
  end
end
