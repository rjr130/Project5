class AccountsController < ApplicationController
	def index
    end

    def edit
	    @account = current_user.accounts.find_by_id(params[:id])
    end

	def create
		@account = current_user.accounts.build(account_params)
		@user = current_user;
	    if @account.save
	      flash[:success] = "Account created!"
	      redirect_to @user
	    else
	      render 'static_pages/home'
	    end
  	end

  	def update
	    @account = current_user.accounts.find_by_id(params[:id])
		@user = current_user;
		@account.destroy;
		@account = current_user.accounts.build(account_params)
	    if @account.save
	      flash[:success] = "Account created!"
	      redirect_to @user
	    else
	      render 'static_pages/home'
	    end
  end

    def destroy
		@user = current_user;
		@account = current_user.accounts.find_by_id(params[:id])
	    @account.destroy
	    redirect_to @user
	end

	private

    def account_params
      params.require(:account).permit(:username, :password, :host)
    end
end
