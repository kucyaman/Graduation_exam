class PagesController < ApplicationController
  before_action :set_book

  def new
    3.times { @book.pages.build }
  end

  def create
    ActiveRecord::Base.transaction do
      @book.assign_attributes(book_params)
      @book.pages.each_with_index do |page, index|
        page.page_number = index + 1
      end

      if @book.save
        image_urls = []

        @book.pages.each do |page|
          if page.photo.file.present?
            image_url = page.photo.url
            image_urls << image_url
          end
        end
        open_ai_api = OpenAiApi.new
        descriptions = open_ai_api.fetch_image_description(image_urls)
        puts "Image Descriptions: #{descriptions}"
        story_parts = open_ai_api.create_story(descriptions)
        puts "Generated Story: #{story_parts}"

        split_parts = split_story_into_parts(story_parts)
        @book.pages.each_with_index do |page, index|
          page.content = split_parts[index] if split_parts[index]
        end

        @book.save
        redirect_to books_path
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

  def split_story_into_parts(story_parts)
    parts = story_parts.split("\n")
    parts.map { |part| part.sub(/^\d+:\s*/, '') }
  end
end
