defmodule Listophobic.Preference.InterestItem do
    use Ecto.Schema
    import Ecto.Changeset

    schema "interest_items" do
        field :title, :string
        field :order, :integer
        field :description, :string
        field :link, :string

        belongs_to :interest, Listophobic.Preference.Interest

        timestamps()
    end

    def changeset(interest_item, attrs) do
        required_fields = [:title]
        optional_fields = [:order, :description, :link]

        interest_item
        |> cast(attrs, required_fields ++ optional_fields)
        |> validate_required(required_fields)
        # |> unique_constraint(:order)
        |> assoc_constraint(:interest)

    end

end