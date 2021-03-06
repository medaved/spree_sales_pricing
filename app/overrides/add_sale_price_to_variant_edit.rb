Deface::Override.new(virtual_path: 'spree/admin/variants/_form',
                     name: 'add_sale_price_to_variant_edit',
                     insert_after: "erb[loud]:contains('text_field :price')",
                     text: "
    <div data-hook='sale_price'>
      <%= f.label :sale_price, raw(Spree.t(:sale_price) ) %>
      <%= f.text_field :sale_price, value:
        number_to_currency(@variant.sale_price, unit: ''), class: 'form-control' %>
      <%= f.error_message_on :sale_price %>
    </div>
  ")