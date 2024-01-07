class PagesController < ApplicationController
  before_action :set_book

  def new
    # 3つのpageを準備
    3.times { @book.pages.build }
  end

  def create
    ActiveRecord::Base.transaction do
      @book.assign_attributes(book_params)

      @book.pages.each_with_index do |page, index|
        page.page_number = index + 1
      end

      if @book.save
        redirect_to books_path, success: "Pageの作成に成功しました"
      else
        flash.now[:danger] = @book.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:danger] = e.message
    render :new, status: :unprocessable_entity
  end

  private

  def set_book
    @book = current_user.books.find(params[:book_id])
  end

  def book_params
    params.require(:book).permit(pages_attributes: [:id, :photo, :content, :page_number])
  end
end
