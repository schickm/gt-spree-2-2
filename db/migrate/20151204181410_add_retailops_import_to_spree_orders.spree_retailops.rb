# This migration comes from spree_retailops (originally 20140501000119)
class AddRetailopsImportToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :retailops_import, :string, { default: 'no' }
    add_index  :spree_orders, [ :retailops_import ]
  end
end
