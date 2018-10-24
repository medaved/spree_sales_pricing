Spree::Product.class_eval do
  delegate :sale_price, :sale_price=, to: :master

  def price_in(currency)
    return orig_price_in(currency) unless sale_price.present?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end
end