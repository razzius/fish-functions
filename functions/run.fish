# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.JNlOYM/run.fish @ line 2
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
