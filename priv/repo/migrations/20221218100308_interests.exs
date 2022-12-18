defmodule Listophobic.Repo.Migrations.Interests do
  use Ecto.Migration

  def change do
    create table(:interests) do
      add :title, :string, null: false
      add :description, :string, null: true
      add :topic, :string, null: false
      add :slug, :string, null: false
      add :pg_required, :boolean, default: true
      add :is_public, :boolean, default: false
      add :times_upvoted, :integer, default: 0
      add :times_copied, :integer, default: 0
      add :total_viewed, :integer, default: 0
      add :user_id, references(:users), null: false
      
      timestamps()
    end
    create index(:interests, [:user_id])
  end
end
