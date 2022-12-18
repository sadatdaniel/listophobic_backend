defmodule Listophobic.Preference.Interest do
    use Ecto.Schema
    import Ecto.Changeset

    schema "interests" do
        field :title, :string
        field :description, :string
        field :topic, :string
        field :slug, :string
        field :pg_required, :boolean, default: true
        field :is_public, :boolean, default: false
        field :times_upvoted, :integer, default: 0
        field :times_copied, :integer, default: 0
        field :total_viewed, :integer, default: 0
        # field :interest_items


        field :creation_date, :date
        # field :last_updated, :date

        belongs_to :user, Listophobic.Accounts.User
        has_many :interest_items, Listophobic.Preference.InterestItem

        timestamps()
    end

    def changeset(interest, attrs) do
        required_fields = [:title, :slug, :topic, :pg_required, :is_public, :user_id]
        optional_fields = [:description, :times_upvoted, :times_upvoted, :total_viewed]

        interest
        |> cast(attrs, required_fields ++ optional_fields)
        |> validate_required(required_fields)
        |> unique_constraint(:slug)
        |> assoc_constraint(:user)

    end



end