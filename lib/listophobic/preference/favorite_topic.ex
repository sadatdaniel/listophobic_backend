defmodule Listophobic.Preference.FavoriteTopic do
    use Ecto.Schema
    import Ecto.Changeset

    schema "favorite_topics" do
        field :name, :string
        belongs_to :user, Listophobic.Accounts.User
        timestamps()
    end

    def changeset(topic, attrs) do
        required_fields = [:name]

        topic
        |> cast(attrs, required_fields)
        |> validate_required(required_fields)

    end

end