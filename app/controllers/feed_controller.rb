class FeedController < ApplicationController

  def new
    @store_credential = StoreCredential.new
  end

  def create
    @store_credential = StoreCredential.new(store_credential_params)
    if @store_credential.valid?
      begin
        @xml = ProductsFeed.new(@store_credential).generate
      rescue => e
        flash.now[:danger] = "Unable to connect with Shopify. Please verify following credentials are correct."
        render :new
      end
    else
      flash.now[:danger] = store_credential.errors.full_messages
      render :new
    end
  end

  private

  def store_credential_params
    params.require(:store_credential).permit(:api_key, :api_password, :store_name)
  end
end
