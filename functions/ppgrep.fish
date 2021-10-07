function ppgrep --argument pattern
    pgrep $pattern | xargs pstree
end
