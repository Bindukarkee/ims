class CustomersController < ApplicationController


  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @customer = Customer.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer= Customer.find(params[:id])
    @log = Log.create(description: "Updated Customer: " + @customer.name, user: current_user)
    @customer.update(customer_param)
    redirect_to @customer
  end

  def destroy
    @customer = Customer.destroy(params[:id])
    @log = Log.create(description: "Deleted Customer: " + @customer.name, user: current_user)
    redirect_to @customer
  end


  def create
    @customer = Customer.new(customer_param)
    if @customer.save
      @log = Log.create(description: "Created Customer: " + @customer.name, user: current_user)
      redirect_to @customer
    else
      render 'new'
    end
  end

def view
  @page = params[:page] || 1
  @customer = Customer.paginate(:page => params[:page], :per_page => 4)
end


  private
  def customer_param
    params.require(:customer).permit(:name, :address, :phone_no)
  end

end
