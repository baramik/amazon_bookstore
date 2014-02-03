class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @books
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
