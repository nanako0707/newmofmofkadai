class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    #インスタンスをインスタンス変数に代入。ビューにデータを渡す
    @property = Property.new
  end

  def create
    #paramsメソッドを使用し、送られてきたparameterを全て取得。モデルにDB操作の命令を出す。
    @property = Property.new(property_params)
    if @property.save
      #一覧画面へ遷移して、"物件を登録しました！"とメッセージを表示する。
      redirect_to properties_path, notice: "物件を登録しました！"
    else
    #入力フォーム(new.html.erb)を再描写
    render :new
    end
  end

  def edit
    #paramsメソッドにより、parametersの値を取得。
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました！"
    else
      render :edit
    end
  end

  private
  def property_params
    (params.require(:property).permit(:property_name, :rent, :street_address, :age, :note))
  end
end
