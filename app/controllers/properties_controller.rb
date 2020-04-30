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
    Property.create(property_params)
    #new_property_pathというPrefixを書くことで、"/properties/new"というURLの指定をします、という意味になる
    redirect_to new_property_path
  end
  private
  def property_params
    (params.require(:property).permit(:property_name, :rent, :street_address, :age, :note))
  end
end
