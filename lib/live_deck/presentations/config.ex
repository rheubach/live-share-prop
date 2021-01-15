defmodule LiveDeck.Presentations.Config do
  @moduledoc """
    Use this Configuration to adjust Presentation settings, including position, background color, and title of slides.
  """

  @default_background "back--1"
  @default_slides [
    %{
      filename: "template_title.html",
      title: "Cutomer Advocatcy",
      background_color: "back--2"
    },
    %{
      filename: "template_full_image.html",
      title: "Team Gaslight",
      background_color: "back--1"
    },
    %{
      filename: "orginization_wide_user_journey.html",
      title: "Orginization Wide",
      background_color: "back--2"
    },
    %{
      filename: "orginization_web.html",
      title: "Orginization Web",
      background_color: "back--2"
    },
    %{
      filename: "orginization_alone.html",
      title: "Orginization Web",
      background_color: "back--2"
    },
    %{
      filename: "orginization_change.html",
      title: "Orginization Change",
      background_color: "back--2"
    },
    %{
      filename: "orginization_answer.html",
      title: "Orginization Answer",
      background_color: "back--2"
    },
    %{
      filename: "principle_one.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "learning_what.html",
      title: "Customer Learning What",
      background_color: "back--1"
    },
    %{
      filename: "learning_how.html",
      title: "Customer Learning How",
      background_color: "back--1"
    },
    %{
      filename: "learning_unique.html",
      title: "Customer Learning Unique",
      background_color: "back--1"
    },
    %{
      filename: "learning_unfinished.html",
      title: "Customer Learning UnFinished",
      background_color: "back--1"
    },
    %{
      filename: "principle_two.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{
      filename: "principle_three.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "principle_four.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{
      filename: "principle_five.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "principle_six.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{
      filename: "principle_seven.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "principle_eight.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{filename: "template_2_col.html", title: "What is LiveShare", background_color: "back--1"},
    %{filename: "template_bullet_list.html", title: "Key Features"},
    %{
      filename: "template_left_aside.html",
      title: "Customer Segments",
      background_color: "back--2"
    },
    %{
      filename: "template_quote_2.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{filename: "template_page_split.html", title: "Subject Experts"},
    %{
      filename: "template_quote.html",
      title: "Knowledge Seekers Quote",
      background_color: "back--1"
    },
    %{filename: "template_page_split_2.html", title: "Knowledge Seekers"},
    %{
      filename: "template_right_aside.html",
      title: "Talk Engagments",
      background_color: "back--2"
    },
    %{
      filename: "template_side_image.html",
      title: "Talk Engagments 2",
      background_color: "back--1"
    },
    %{filename: "template_3_col.html", title: "Product Revenue", background_color: "back--2"}
  ]
  # This is for testing purposes
  @dummy List.first(@default_slides).filename

  @doc """
  Provide the theme name you want to use here. This name must coincide with a stylesheet in assets/css, and optionally a theme's template background in templates/background/
  """
  @spec theme() :: String.t()
  def theme do
    "theme-live-deck"
  end

  def slides do
    @default_slides
    |> insert_notes()
    |> insert_background_color()
  end

  def insert_notes(slides) do
    slides
    |> Enum.map(fn %{filename: filename} = config ->
      Map.put(config, :notes, notes(for: filename))
    end)
  end

  defp insert_background_color(slides) do
    slides
    |> Enum.map(fn config ->
      case config[:background_color] do
        nil -> Map.put(config, :background_color, @default_background)
        _ -> config
      end
    end)
  end

  defp notes(for: @dummy) do
    "Hi. I am your notes."
  end

  defp notes(for: "template_2_col.html") do
    "I am some more notes for your reading pleasure while you are presenting."
  end

  defp notes(_), do: ""
end
