defmodule Listophobic.Accounts.User do
    use Ecto.Schema
    import Ecto.Changeset

    @schema_prefix
    schema "users" do
        field :username, :string
        field :email, :string
        field :slug, :string
        field :password_hash, :string
        field :password, :string, virtual: true
        field :birth_date, :date
        field :is_verified, :boolean, default: false
        field :image_url, :string
        field :account_viewed, :integer, default: 0

        has_many :topics, Listophobic.Preference.Topic
        has_many :interests, Listophobic.Preference.Interest
        has_many :favorites, Listophobic.Preference.Interest

        timestamps()
    end

    def changeset(user, attrs) do
        required_fields = [:username, :email, :password, :slug, :birth_date]
        optional_fields = [:is_verified, :image_url, :account_viewed]

        user
        |> cast(attrs, required_fields ++ optional_fields)
        |> validate_required(required_fields)
        |> validate_length(:username, min: 2)
        |> validate_length(:password, min: 6)
        |> unique_constraint(:slug)
        |> unique_constraint(:username)
        |> unique_constraint(:email)
        |> hash_password()

    end

    defp hash_password(changeset) do
        # case changeset do
        #     %Ecto.Changeset{valid?: true, changes: %{password: password}} -> 
        #         put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password)) _ -> 
        #             changeset
        # end
        case changeset do
            %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
              put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
            _ ->
              changeset
          end
    end





end