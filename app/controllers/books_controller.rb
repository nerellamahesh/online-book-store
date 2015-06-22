class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :index
  
  def index
    @books = Book.all
    @count = cart_count
    
  end
  
  def show
   @book=Book.find(params[:id]) 
  end
  
  def show_by_category
   # @categories = Book.category.find(:all)
  end
  
  def search
            
    if !params[:search].blank?
      @books = Book.search_from(params[:search_from], params[:search])
    elsif ((params[:search_from] == 'all') && (params[:search].blank?))
      @books = Book.all
    elsif params[:search].blank?
      redirect_to root_path
    end
    
  end
 
 def category
    @books = Book.category(params[:category])
 end
 
  # GET /books/new
  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :ISBN, :price,:image, :category)
    end
end