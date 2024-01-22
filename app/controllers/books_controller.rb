class BooksController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index; end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to new_book_page_path(book_id: @book.id)
    else
      flash.now[:danger] = "Bookの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = book
  end

  private

  def book_params
    params.require(:book).permit(:title, :design_type)
  end
end
