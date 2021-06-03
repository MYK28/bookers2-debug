class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    # comment = BookComment.new(book_comment_params)
    # comment.user_id = current_user.id
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
    # redirect_to book_path(book.id)
    redirect_to request.referer
    else

    redirect_back(fallback_location: root_path) #redirect_backはrenderの代わりに使用できる
    flash[:notice]= '入力欄に記入してください。'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_to book_path(params[:book_id])
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
