class Api::V1::ExamplesController < ApplicationController
  before_action :set_example, only: [:show, :update, :destroy]

  def index
    @examples = Example.all

    render json: @examples
  end

  def show
    render json: @example
  end

  def create
    @example = Example.new(example_params)

    if @example.save
      render json: @example, status: :created
    else
      render json: @example.errors, status: :unprocessable_entity
    end
  end

  def update
    if @example.update(example_params)
      render json: @example
    else
      render json: @example.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @example.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_example
    @example = Example.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def example_params
    params.require(:example).permit(:code, :value)
  end
end
