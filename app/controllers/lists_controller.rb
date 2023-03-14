class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
    # データの一覧画面用として定義する
    @lists = List.all
  end

  def show
  end

  def edit
  end

  # ここから下はcontrollerの中でしか呼び出せない
  private
  # ストロングパラメータ(悪意のあるデータを防ぐセキュリティ)
  def list_params
    params.require(:list).permit(:title, :body)
  end
end