class FeedbacksController < ApplicationController

  before_filter :is_admin?, :only => [:index, :destroy]

  def index
    @feedbacks = Feedback.all
  end

  def new
    @title = t('feedback')
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new params[:feedback]
    if @feedback.save
      flash[:success] = t('thanks_for_addressing')
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @feedback = Feedback.find params[:id]
    @feedback.delete
    redirect_to :back
  end

end