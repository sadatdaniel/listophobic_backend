defmodule Listophobic.Repo.Migrations.InterestItems do
  use Ecto.Migration

  def change do
    create table(:interest_items) do
      add :title, :string, null: false
      add :order, :integer, null: false
      add :description, :string
      add :link, :string
      add :interest_id, references(:interests), null: false
      
      timestamps()
    end
    create index(:interest_items, [:interest_id])
  end
end
