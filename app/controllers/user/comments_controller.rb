class User::CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@item = Item.find(params[:item_id])
		@comment = @item.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			render :index
		else
			render :index
		end
	end
	def destroy
	    @comment = Comment.find(params[:id]) #⑤
	    if @comment.destroy
	     	render :index #⑥
	  	else
	  		render :index
	    end
  	end

  	private
    def comment_params
      params.require(:comment).permit(:title,:comment,:image_id, :item_id, :user_id)
    end
end