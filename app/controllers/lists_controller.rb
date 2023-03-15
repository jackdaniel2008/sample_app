class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # 詳細画面へリダイレクト
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    # データの一覧画面用として定義する
    @lists = List.all
  end

  def show
    # 1件だけ取得するためインスタンス変数は単数形
    @list = List.find(params[:id])
  end

  def destroy
    list = List.find(params[:id]) # データ(レコード)を1件取得
    list.destroy # データ(レコード)を削除
    redirect_to '/lists' # 投稿一覧へリダイレクト
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  # ここから下はcontrollerの中でしか呼び出せない
  private
  # ストロングパラメータ(悪意のあるデータを防ぐセキュリティ)
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end