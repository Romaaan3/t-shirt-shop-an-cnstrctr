class Fe::StaticPagesController < ApplicationController

  def main
    @active_block = Block.find_by_name("Главная")
    @order = Order.new
    @reviews = Review.where(isValid: true).order("RANDOM()").limit(2)
    @all_reviews = Review.where(isValid: true)
    @constructor_images = ConstructorImage.all
    @products = Product.all
  end

  def dostavka_i_oplata
    @active_block = Block.find_by_name("Оплата и доставка")
  end

  def kontakty
    @request = Request.new
    @active_block = Block.find_by_name("Контакты")
  end

  def price
    @active_block = Block.find_by_name("Цена")
    @products = Product.all
  end

  def shirts
    @active_block = Block.find_by_name("Майки")
  end

  def events
    @active_block = Block.find_by_name("Events-опт")
  end

  def mans_shirt
    @title = "Мужская майка"
  end
end
