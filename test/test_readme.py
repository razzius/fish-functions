import os

with open('README.md') as f:
    readme = f.read()

function_lines = [
    line for line in readme.splitlines()
    if line.startswith('###')
]

functions = [line.split()[1].strip('`') for line in function_lines]

missing_functions = [
    function
    for function in functions
    if not os.path.exists(f'functions/{function}.fish')
]

if missing_functions:
    print(f'Missing functions: {missing_functions}')
