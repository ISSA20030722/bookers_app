class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    # viewで表示させたいから@つける
    @book = Book.new
  end

  def edit
  end
end
