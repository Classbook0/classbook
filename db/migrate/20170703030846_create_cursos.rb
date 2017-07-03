class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
