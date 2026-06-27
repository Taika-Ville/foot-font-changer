footfont() {
    # 1. Get a clean list of all installed font families, pipe to fzf for selection
    local chosen_font=$(fc-list : family | cut -d, -f1 | sort -u | fzf --prompt="Select Foot Font: ")
    
    # 2. If a font was chosen, apply it to foot.ini
    if [ -n "$chosen_font" ]; then
        sed -i "s/^font=.*/font=$chosen_font:size=14/" ~/.config/foot/foot.ini
        echo "Font changed to: $chosen_font"
    fi
}
