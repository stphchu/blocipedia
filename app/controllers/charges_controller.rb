class ChargesController < ApplicationController

#NEW
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium Account",     
      amount: Amount.premium
    }
  end

#CREATE
  def create
    # Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
 
    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.premium,
      description: "Blocipedia Premium Account - #{current_user.email}",
      currency: 'usd'
    )
     
    flash[:notice] = "Thank you for your payment, #{current_user.email}! Your account is now upgraded."
    current_user.premium!
    redirect_to :root
 
    # Stripe will send back CardErrors, with friendly messages when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

end
