require "rails_helper"

RSpec.feature "用户可以将商品添加到购物车" do
  # given(:product) { FactoryGirl.create(:product, name: "电水壶", price: 50) }
  given(:user) { FactoryGirl.create(:user) }

  scenario "如果正确填写商品数量" do
    FactoryGirl.create(:product, name: "电水壶", price: 50)
    login_as(user)
    
    visit "/"
    click_link "电水壶"

    fill_in "Goods amount", with: "5"
    click_button "Add to cart"

    expect(page).to have_content "商品已经成功加入购物车"
  end

  # scenario "when providing invalid attributes" do
  #   click_button "Create Project"
    
  #   expect(page).to have_content "Project has not been created."
  #   expect(page).to have_content "Name can't be blank"
  # end
end
