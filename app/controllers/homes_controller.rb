class HomesController < ApplicationController


    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    def index
      @page = params[:page] || 1
      @user = User.paginate(:page => params[:page], :per_page => 4)
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user= User.find(params[:id])
      @user.update(user_param)
      redirect_to @user
    end

    def destroy
      @user = User.destroy(params[:id])
      @log = Log.create(description: "User is updated" + @user.email, user: current_user)
      redirect_to @user
    end


    def create
      @user = User.new(user_param)
      if @user.save
        @log = Log.create(description: "Created a User" + @user.email, user: current_user)
        redirect_to @user
      else
        render 'new'
      end
    end

    private
    def user_param
      params.require(:homes).permit(:email, :password, :password_confirmation)
    end

  end
