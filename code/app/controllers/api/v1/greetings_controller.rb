class Api::V1::GreetingsController < ApplicationController
  def index
    render json: { message: 'Hello, World!' }
  end
end
