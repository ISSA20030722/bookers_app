class BooksController < ApplicationController
  def index
    # 投稿一覧表示をするとき、allで保存されたコード一覧を取得できるので、indexでidがつか
    @books = Book.all
    @book = Book.new
    # .all.orderでIDの若い順に
    @books = Book.all.order(:id)
  end

  # 投稿を保存する機能を追加する
  def create
    # 1&2. フォームから送られてきたデータを使って新しいBookオブジェクトを作成する
    @book=Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッドを実行する
    if @book.save
    # 4. フラッシュメッセージを定義し、詳細画面へリダイレクトする
    flash[:notice] = "Successfully created book."
    redirect_to books_path
    else
      # flash.nowは現在のアクションが実行完了したらメッセージを削除する
      flash.now[:alert] = "error!!"
      @books = Book.all.order(:id)
      render :new
    end
  end

  def show
  end

  def new
    # viewで表示させたいから@つける
    @book = Book.new
  end

  def edit
  end

  # ストロングパラメーター
  private
  # フォームから送られてくるパラメーターの中でtitleとbodyだけを許可する
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
