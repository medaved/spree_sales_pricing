Spree::Variant.class_eval do
  alias_method :orig_price_in, :price_in

  def price_in(currency)
    return orig_price_in(currency) unless sale_price.present?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end

  def sale_price=(sale_price)
    super(sale_price.to_money)
  end
end