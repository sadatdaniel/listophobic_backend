defmodule Listophobic.Repo.Migrations.FavoriteTopics do
  use Ecto.Migration

  def change do
    create table(:favorite_topics) do
      add :name, :string, null: false
      add :user_id, references(:users), null: false
      
      timestamps()
    end
    create index(:favorite_topics, [:user_id])
  end
end
