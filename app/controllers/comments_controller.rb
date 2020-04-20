class CommentsController < ApplicationController
  def create
    # @comment = Comment.new(comment_params)
    # #需要新增東西，但是comment屬於這個兩個
    # @comment.item_id = params[:item_id]
    # @comment.user_id = current_user.id
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params.merge(user: current_user))
    # comment.user =  @item

    # @comment = current_user.comments.build(comment_params.merage(item: @item))  
    # @comment.item = @item

    if @comment.save
      # app/views/comments/create.html.erb
      # app/views/comments/create.js.erb
      # render json: {name: '123', age: 18 }
      # redirect_to item_path(params[:item_id]), notice: 'ok'
    else
      render 'items/show', notice: 'failed'
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
