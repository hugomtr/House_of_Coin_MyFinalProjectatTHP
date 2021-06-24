class ChargesController < ApplicationController

    before_action :authenticate_user!
    before_action :is_available_to_buy?

    def new
        @stripe_amount = (current_order.order_total * 100)
    end
    
    def create
        # Before the rescue, at the beginning of the method
        @stripe_amount = (current_order.order_total * 100)
        update_products(current_order)

        begin  
            customer = Stripe::Customer.create({
            email: params[:stripeEmail],
            source: params[:stripeToken],
        })  

        charge = Stripe::Charge.create({
            customer: customer.id,
            amount: @stripe_amount,
            description: "Achat d'un produit",
            currency: 'eur',
        })

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
        end

        Charge.create(
            stripe_id: customer,
            user_id: current_user.id,
            order_id: current_order.id
        )

        session[:order_id] = nil 
        flash[:notice] = "Payment registered !"
        redirect_to root_path
    end
end
