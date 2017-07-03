class CreateNota < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.decimal :n1
      t.decimal :n2
      t.decimal :n3
      t.decimal :n4
      t.decimal :nf
      t.references :curso, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
