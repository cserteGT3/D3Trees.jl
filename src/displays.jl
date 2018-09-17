function blink(t::D3Tree)
    w = Window()
    str = stringmime(MIME("text/html"), t)
    # println(str)
    body!(w, str)
    return w
end

function inchrome(t::D3Tree)
    fname = joinpath(mktempdir(), "tree.html")
    open(fname, "w") do f
        show(f, MIME("text/html"), t)
    end
    if Sys.iswindows()
        run(`cmd /C start chrome "$fname"`)
    else
        run(`google-chrome $fname`)
    end
end

function inbrowser(t::D3Tree, browsername::String)
    fname = joinpath(mktempdir(), "tree.html")
    open(fname, "w") do f
        show(f, MIME("text/html"), t)
    end
    if Sys.iswindows()
        run(`cmd /C start $browsername "$fname"`)
    else
        run(`$browsername $fname`)
    end
end
