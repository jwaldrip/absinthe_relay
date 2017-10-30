defmodule AbsintheRelay.Mixfile do
  use Mix.Project

  @version "1.4.0-rc.0"

  def project do
    [app: :absinthe_relay,
     version: @version,
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     docs: [source_ref: "v#{@version}", main: "Absinthe.Relay"],
     deps: deps()]
  end

  defp package do
    [description: "Relay framework support for Absinthe",
     files: ["lib", "mix.exs", "README*"],
     maintainers: ["Bruce Williams", "Ben Wilson"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/absinthe-graphql/absinthe_relay"}]
  end

  def application do
    [applications: [:logger, :absinthe]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:absinthe, "~> 1.4.0-rc.0 or ~> 1.4.0"},
      {:ecto, "~> 2.0", optional: true},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_spec, "~> 1.0.0", only: :test}
    ]
  end

end
