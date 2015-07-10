module ApplicationHelper
  def shop_tag(item)
    shop = item.shop
    chain_shop = item.chain_shop
    content_tag :div, class: 'ramen-shop'
    if shop.present?
      body = shop_to(shop)
      if chain_shop.present?
        body += '('
        body += chain_shop_to(chain_shop)
        body += ')'
      end
    else
      body = content_tag :div, "どこかのお店", class: "shop-nothing"
    end
    body
  end

  def shop_to(shop)
    link_to shop.name, shops_ramen_index_path(shop.id)
  end

  def chain_shop_to(chain_shop)
    link_to chain_shop.name, chain_shops_ramen_index_path(chain_shop.id)
  end
end
