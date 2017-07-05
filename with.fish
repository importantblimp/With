function with
    while true
        read --local --shell --command="$argv " --prompt=read_prompt cmd
        eval $cmd
    end
end

function read_prompt
        set_color green
        echo -n with
        set_color normal
        echo -n "> "
end