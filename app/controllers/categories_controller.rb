class CategoriesController < ApplicationController
	def create
  		@account = current_user.accounts.build if signed_in?
		@category = Category.new(category_params)
		@user = current_user;
	    if @category.save
	      flash[:success] = "Category created!"
	      render 'static_pages/home'
	    else
	      render 'static_pages/home'
	    end
	end

	private

    def category_params
      params.require(:category).permit(:name)
    end
end
