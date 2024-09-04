// typstファイルで読み込むテンプレートファイル
#import emoji

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

/*
HOW TO USE

#align(
  center,
  opt_problem(
    $ sum_(j=1)^m w_j $,
    maximize: false,
    variables: $ P in RR^(d times d) $,
    $ P^T P = I $,
    $ P^T P = "ABCDEFGIJLETSGOOO" $,
  )
)
*/
#let opt_problem(
    objective-func,
    maximize: true,
    variables: none,
    ..constraints,
) = {
    let c = if maximize {
            "maximize"
        } else {
            "minimize"
        }
    block(
        // fill: red, // for debug
        stack(
            dir: ttb,
            spacing: 0.5em,
            stack(
                dir: ltr,
                spacing: 0.8em,
                align(horizon + left, math.attach(math.limits(c), b: variables)),objective-func,
            ),
            stack(
                dir: ltr,
                spacing: 0.8em,
                align(horizon + left, "subject to"),
                stack(
                    dir: ttb,
                    spacing: 0.4em,
                    ..constraints.pos(),
                )
            )
        ),
    )
}

// physicaにあるので、これはもういらないかも
#let diag = math.op("diag", limits: false)

#let rate(
    kind, // e.g. 線形代数, 確率
    difficulty, // E, N, H, L is fine
) = {
    let s = if regex("(?i)\b(e|easy)\b") in difficulty {
        "Easy"
    } else if regex("(?i)\b(n|normal)\b") in difficulty {
        "Normal"
    } else if regex("(?i)\b(h|hard)\b") in difficulty {
        "Hard"
    } else {
        "Lunatic"
    }
    stack(
        dir: ttb,
        spacing: 0.5em,
        text(weight: "semibold", "ジャンル: " + kind),
        text(weight: "semibold", "難易度: " + s)
    )
    
}

#let url_link(url, title, color: blue) = link(url, text(title, fill: color))

#let numeq = math.equation.with(numbering: "(1)", block: true, number-align: bottom, supplement: "式")

#let mytemplate(
    problem_year, // if you had a exam in Aug 2023, 2024 is good
    problem_num, // 1-5 is fine
    author, // writer's name
    kind, // e.g. 線形代数, 解析、確率
    difficulty, // easy, normal, hard, lunatic is fine
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

    stack(
        dir: ltr,
        align(
            horizon + left, 
            heading(
                text([#problem_year;年 第#problem_num;問], font: jp_font, size: 20pt),
                numbering: none
            )
        ),
        align(
            horizon + right,
            rate(kind, difficulty)
        )
    )
    /*
    heading(
        text([#problem_year;年 第#problem_num;問], font: jp_font, size: 20pt), numbering: none,
    )*/

    doc
}