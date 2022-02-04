class BillingsController < ApplicationController
  before_action :authenticate_user!

  def create
    session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_id,
      return_url: root_url
    })
    redirect_to session.url, allow_other_host: true
  end
end
