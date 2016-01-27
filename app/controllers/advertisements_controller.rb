class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
    # binding.pry
    # @advertisements.each_with_index do |advertisement, index|
    #   if index % 5 == 0
    #     advertisement.title = "SPAM"
    #   end
    # end

  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end
  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    if @advertisement.save
      flash[:notice] = "Advertisement was saved"
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end
end
