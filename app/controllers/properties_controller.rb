class PropertiesController < ApplicationController
  def index
  end

  def new
    #インスタンスをインスタンス変数に代入。
    @property = Property.new
  end

  def create
    #paramsメソッドを使用し、送られてきたparameterを全て取得。
    Property.create(property_name: params[:property][:property_name], rent: params[:property][:rent], street_address: params[:property][:street_address], age: params[:property][:age],
    note: params[:property][:note])
  end
end
