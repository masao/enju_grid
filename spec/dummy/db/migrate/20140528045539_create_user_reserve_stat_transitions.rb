class CreateUserReserveStatTransitions < ActiveRecord::Migration
  def change
    create_table :user_reserve_stat_transitions do |t|
      t.string :to_state
      t.text :metadata, default: "{}"
      t.integer :sort_key
      t.integer :user_reserve_stat_id
      t.timestamps
    end

    add_index :user_reserve_stat_transitions, :user_reserve_stat_id
    add_index :user_reserve_stat_transitions, [:sort_key, :user_reserve_stat_id], unique: true, name: "index_user_reserve_stat_transitions_on_sort_key_and_stat_id"
  end
end
