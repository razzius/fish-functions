# Defined in /var/folders/5r/x8hb9kbd5751zn4pz9yq24s80000gn/T//fish.izR44f/run.fish @ line 2
function run
	if test -e manage.py
django-admin runserver
else if test -e package.json
npm start
else if test -e Pipfile
pipenv run start
end
end
