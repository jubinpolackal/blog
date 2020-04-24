# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to articles_path if logged_in?
  end

  def about
    pp 'About action selected'
  end
end
