class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
    @property.stations.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: "物件を登録出来ました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    if @property.update(property_params)
      redirect_to @property, notice: "物件を更新出来ました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
      redirect_to properties_url, notice: "物件を削除できました！"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :property, :age, :remarks, stations_attributes: [:route, :station, :walking_minutes])
    end
end
