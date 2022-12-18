defmodule Listophobic.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :birth_date, :date
      add :is_verified, :boolean, default: false
      add :image_url, :string
      add :account_viewed, :integer, default: 0
      add :slug, :string, null: false
      
      timestamps()
    end
    create unique_index(:users, [:username, :email])
    create unique_index(:users, [:slug])
  end
end
