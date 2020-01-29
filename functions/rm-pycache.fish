function rm-pycache
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
end
