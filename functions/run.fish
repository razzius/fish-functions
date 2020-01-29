function run
    if test -e manage.py
        if not set -q VIRTUAL_ENV[1]
            if test -e .venv
                vf activate (cat .venv)
            end
        end
        django-admin runserver
    else if test -e package.json
        npm start
    else if test -e Pipfile
        pipenv run start
    end
end
