// typstファイルで読み込むテンプレートファイル
#import emoji

#let mytemplate(
    problem_year, // if you had a exam in Aug 2023, 2024 is good
    problem_num, // 1-5 is fine
    author, // writer's name
    doc
    ) = {
    set page(
        paper: "a4",
        margin: (x: 25mm, y: 25mm),
        columns: 1,
        numbering: "1 / 1",
        number-align: center + bottom,
    )

    set par(
        justify: true,
        // first-line-indent: 1em,
    )

    set document(
        author: author, 
        date: auto,
        title: [#problem_year;年第#problem_num;問],
    )
    
    // 数式のフォント
    show math.equation: set text(font: "New Computer Modern Math")

    // 日本語の文字は原ノ味明朝
    let jp_font = "Harano Aji Mincho"
    show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(
        font: jp_font, 
        lang: "ja", 
    )

    set heading(numbering: none)
    show heading.where(level: 2): set text(size: 14pt)

    heading(
        text([#problem_year;年 第#problem_num;問], font: jp_font, size: 20pt), numbering: none,
    )

    doc
}
/*
#let green = rgb(43,99,0)
#let yellow = rgb(104,81,4)
#let red = rgb(109,3,3)
*/
#let colored_block(
    color,
    title,
    background-color: none,
    content,
) = {
    block(
        width: 100%,
        inset: (left: 1.25em, right: .5em, top: 0.7em, bottom: 0.7em),
        stroke: (left: 3pt + color),
        fill: background-color,
        [
            #text(weight: "bold",size: 12pt, title)
            #linebreak()
            #content
        ]
    )
}
#let overview(
    content,
    background-color: none,
) = {
    let mycolor = rgb(31, 136, 61)
    colored_block(mycolor, emoji.book.open + "問題の概要", content)
}
#let warning(
    content,
    background-color: none,
)= {
    let mycolor = rgb(191,135,0)
    colored_block(mycolor, emoji.warning + "注意", content)
}