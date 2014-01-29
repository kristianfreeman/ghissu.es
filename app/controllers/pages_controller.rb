class PagesController < ApplicationController
  def home
    render json: "issu.es\n\nEasy embedding of Github Issues.\n\nMake a script tag in the following format:\n\n<script src='http://issu.es/organization/repo?issue=number'></script>"
  end
end
