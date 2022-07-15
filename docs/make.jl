using Series
using Documenter

DocMeta.setdocmeta!(Series, :DocTestSetup, :(using Series); recursive=true)

makedocs(;
    modules=[Series],
    authors="Gianfranco Ponza <GianProgrammer@yahoo.it>",
    repo="https://github.com/gianeering/Series.jl/blob/{commit}{path}#{line}",
    sitename="Series.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gianeering.github.io/Series.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gianeering/Series.jl",
    devbranch="main",
)
