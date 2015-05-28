require 'rails_helper'

describe "Order" do
  it 'Order has an Order Now button' do
    visit item_path(create_item)
    expect(page).to have_content("Order Now")
  end

  xit 'Clicking Order Now button takes the user to the order page showing order details' do
    create_order
    expect(page).to have_content("Confirm Order")
    expect(page).to have_content("Total: $10.00")
    expect(page).to have_content("Item name")
  end

  xit 'Order trigers an email notification to the admin' do
    expect(create_order).to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  def create_order
    visit item_path(create_item)
    click_link_or_button "Order Now"
  end

  def create_item
    Item.create!(name: "Rusty Hammer", description: "It's rusty but it works.")
  end
end
