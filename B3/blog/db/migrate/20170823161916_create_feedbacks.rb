class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.string :author

      t.timestamps
    end
  end
end
