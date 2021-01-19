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
      filename: "change_fear.html",
      title: "Fear Change",
      background_color: "back--2"
    },
    %{
      filename: "change_everything.html",
      title: "Love Change",
      background_color: "back--2"
    },
    %{
      filename: "change_hard.html",
      title: "Change is Hard",
      background_color: "back--2"
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
      background_color: "back--2"
    },
    %{
      filename: "principle_two.html",
      title: "Personal Experiences",
      background_color: "back--2"
    },
    %{
      filename: "experience_brands.html",
      title: "Personal Experiences Brands",
      background_color: "back--2"
    },
    %{
      filename: "experience_point.html",
      title: "Personal Experiences Point",
      background_color: "back--2"
    },
    %{
      filename: "principle_three.html",
      title: "Problem Solving",
      background_color: "back--1"
    },
    %{
      filename: "problem_solving_ideas.html",
      title: "Problem Solving Ideas",
      background_color: "back--2"
    },
    %{
      filename: "problem_solving_tips.html",
      title: "Problem Solving Tips",
      background_color: "back--1"
    },
    %{
      filename: "problem_solving_quote.html",
      title: "Problem Solving Quote",
      background_color: "back--1"
    },
    %{
      filename: "problem_solving_oriantation.html",
      title: "Problem Solving Oriantation",
      background_color: "back--2"
    },
    %{
      filename: "principle_four.html",
      title: "Track & Measure",
      background_color: "back--2"
    },
    %{
      filename: "measuring_quote.html",
      title: "Track & Measuring Quote",
      background_color: "back--2"
    },
    %{
      filename: "measuring_goal.html",
      title: "Track & Measuring Goal",
      background_color: "back--2"
    },
    %{
      filename: "measuring_methods.html",
      title: "Track & Measuring Methods",
      background_color: "back--2"
    },
    %{
      filename: "measuring_simple.html",
      title: "Keep Measuring Simple",
      background_color: "back--2"
    },
    %{
      filename: "principle_five.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "buisness_quote.html",
      title: "Buisness Goals Quote",
      background_color: "back--1"
    },
    %{
      filename: "buisness_goals.html",
      title: "Know Your Buisness Goals",
      background_color: "back--1"
    },
    %{
      filename: "buisness_viable.html",
      title: "Is The Solution Buisness Viable",
      background_color: "back--2"
    },
    %{
      filename: "principle_six.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{
      filename: "orginization_web.html",
      title: "Orginization Web",
      background_color: "back--2"
    },
    %{
      filename: "orginization_too_small.html",
      title: "No Touch Point Too Small",
      background_color: "back--2"
    },
    %{
      filename: "principle_seven.html",
      title: "Subject Expert Quote",
      background_color: "back--1"
    },
    %{
      filename: "cost.html",
      title: "The Cost of Change",
      background_color: "back--1"
    },
    %{
      filename: "principle_eight.html",
      title: "Subject Expert Quote",
      background_color: "back--2"
    },
    %{
      filename: "determind_goal.html",
      title: "Determined Goal",
      background_color: "back--2"
    },
    %{
      filename: "determined_quote.html",
      title: "Determined Quote",
      background_color: "back--2"
    },
    %{
      filename: "template_full_image_2.html",
      title: "Beau @ Gaslight",
      background_color: "back--1"
    }
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

  defp notes(for: "change_hard.html") do
    "Personal Chnage is hard. Orginizational Chnage is Harder."
  end

  defp notes(for: "principle_one.html") do
    "Customer centered thinking is customer driven. We replace our assumptions with understanding"
  end

  defp notes(for: "principle_two.html") do
    "Past customers experiences with strong brands can be the best case for CX."
  end

  defp notes(for: "experience_brands.html") do
    "Talk about Chick-fil-A and Movie Rental Story"
  end

  defp notes(for: "experience_three.html") do
    "Identifying the most destructive problems for customers is just as important as finding the right solution."
  end

  defp notes(for: "experience_six.html") do
    "Great Customer Advocates Create More Customer Advocates"
  end

  defp notes(for: "experience_seven.html") do
    "An orginization wide user journey can impact time, effort, and control."
  end

  defp notes(for: "experience_seven.html") do
    "An orginization wide user journey can impact time, effort, and control."
  end

  defp notes(_), do: ""
end
