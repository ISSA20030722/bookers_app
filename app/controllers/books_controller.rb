class BooksController < ApplicationController
  def index
    # 新規投稿用の空のBookオブジェクトを作成する
    @book = Book.new
    # 投稿一覧表示をするとき、allで保存されたコード一覧を取得できるので、indexでidが使える
    @books = Book.all
    # .all.orderでIDの若い順に
    @books = Book.all.order(:id)
  end

  # 投稿を保存する機能を追加する
  def create
    # 1&2. フォームから送られてきたデータを使って新しいBookオブジェクトを作成する
    @book=Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッドを実行する
    if @book.save
    # 4. フラッシュメッセージを定義し、詳細画面へリダイレクトする,book_path(@book)
    flash[:notice] = "successfully created book."
    redirect_to book_path(@book)
    else
      # flash.nowは現在のアクションが実行完了したらメッセージを削除する
      flash.now[:alert] = "error!!"
      @books = Book.all.order(:id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # viewで表示させたいから@つける
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # アクションの対応ビュー、ここではedit.htmlにアクセスするために@を付ける。
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "error!!"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "Book was successfully deleted."
    else
      flash[:alert] = "Error: Book could not be deleted."
    end
    redirect_to books_path 
  end
    

  # ストロングパラメーター
  private
  # フォームから送られてくるパラメーターの中でtitleとbodyだけを許可する
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
