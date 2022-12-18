# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Listophobic.Repo.insert!(%Listophobic.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Listophobic.Repo.insert!(%Listophobic.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.



alias Listophobic.Repo
alias Listophobic.Accounts.User
alias Listophobic.Preference.{Interest, InterestItem, Topic}


daniel = %User{} 
|> User.changeset(%{
    username: "daniel", 
    email: "sadatdaniel@gmail.com", 
    password: "secret", 
    slug: "daniel", 
    birth_date: ~D[1996-02-22]}) 
|> Repo.insert!

maham = %User{} 
|> User.changeset(%{username: "maham", 
    email: "mahamkhokhar96@gmail.com", 
    password: "secret", 
    slug: "maham", 
    birth_date: ~D[1996-06-15]}) 
|> Repo.insert!

shakira = %User{} 
|> User.changeset(%{username: "shakira", 
    email: "atkiashakira@gmail.com", 
    password: "secret", 
    slug: "shakira", 
    birth_date: ~D[1999-12-10]}) 
|> Repo.insert!

%Interest{
        title: "My favorite books",
        slug: "something", 
        topic: "books",
        user: daniel,
        pg_required: true,
        is_public: true,
        interest_items: [
            %InterestItem{
                title: "Harry Potter",
                link: "amazon.com/books"
            },
            %InterestItem{
                title: "A man called ove",
                link: "amazon.com/books/a_man_called_ove"
            },
        ]
} |> Repo.insert!

%Interest{
        title: "My favorite movies",
        slug: "something1", 
        topic: "movies",
        user: daniel,
        pg_required: true,
        is_public: true,
        interest_items: [
            %InterestItem{
                title: "Harry Potter",
                link: "imdb.com/books"
            },
            %InterestItem{
                title: "Superman movie",
                link: "imdb.com/books/a_man_called_ove"
            },
        ]
    } |> Repo.insert!


    %Interest{
        title: "My favorite animes",
        slug: "something_anime", 
        topic: "movies",
        user: maham,
        pg_required: false,
        is_public: true,
        interest_items: [
            %InterestItem{
                title: "attack on titans",
                link: "kissanime.com/books"
            },
            %InterestItem{
                title: "hunter x hunter",
                link: "kissanime.com/books/a_man_called_ove"
            },
        ]
    } |> Repo.insert!


    %Interest{
        title: "My favorite anime series",
        slug: "something_anime_series", 
        topic: "movies",
        user: shakira,
        pg_required: false,
        is_public: true,
        interest_items: [
            %InterestItem{
                title: "spy x family",
                link: "kissanime.com/books"
            },
            %InterestItem{
                title: "codegeas",
                link: "kissanime.com/books/a_man_called_ove"
            },
        ]
    } |> Repo.insert!