function __fish_poetry_9e90d31f401449f5_complete_no_subcommand
    for i in (commandline -opc)
        if contains -- $i about add build cache:clear check config debug:info debug:resolve develop help init install list lock new publish remove run script search self:update shell show update version
            return 1
        end
    end
    return 0
end

# global options
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l ansi -d 'Force ANSI output'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l help -d 'Display this help message'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l no-ansi -d 'Disable ANSI output'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l no-interaction -d 'Do not ask any interactive question'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l quiet -d 'Do not output any message'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l verbose -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug'
complete -c poetry -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -l version -d 'Display this application version'

# commands
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a about -d 'Short information about Poetry.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a add -d 'Add a new dependency to pyproject.toml.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a build -d 'Builds a package, as a tarball and a wheel by default.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a cache:clear -d 'Clears poetry\'s cache.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a check -d 'Checks the validity of the pyproject.toml file.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a config -d 'Sets/Gets config options.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a debug:info -d 'Shows debug information.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a debug:resolve -d 'Debugs dependency resolution.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a develop -d 'Installs the current project in development mode. (Deprecated)'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a help -d 'Displays help for a command'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a init -d 'Creates a basic pyproject.toml file in the current directory.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a install -d 'Installs the project dependencies.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a list -d 'Lists commands'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a lock -d 'Locks the project dependencies.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a new -d 'Creates a new Python project at <path>'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a publish -d 'Publishes a package to a remote repository.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a remove -d 'Removes a package from the project dependencies.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a run -d 'Runs a command in the appropriate environment.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a script -d 'Executes a script defined in pyproject.toml. (Deprecated)'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a search -d 'Searches for packages on remote repositories.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a self:update -d 'Updates poetry to the latest version.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a shell -d 'Spawns a shell within the virtual environment.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a show -d 'Shows information about packages.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a update -d 'Update dependencies as according to the pyproject.toml file.'
complete -c poetry -f -n '__fish_poetry_9e90d31f401449f5_complete_no_subcommand' -a version -d 'Bumps the version of the project.'

# command options

# about

# add
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l allow-prereleases -d 'Accept prereleases.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l dev -d 'Add package as development dependency.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l dry-run -d 'Outputs the operations but will not execute anything (implicitly enables --verbose).'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l extras -d 'Extras to activate for the dependency.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l git -d 'The url of the Git repository.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l optional -d 'Add as an optional dependency.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l path -d 'The path to a dependency.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l platform -d 'Platforms for which the dependencies must be installed.'
complete -c poetry -A -n '__fish_seen_subcommand_from add' -l python -d 'Python version( for which the dependencies must be installed.'

# build
complete -c poetry -A -n '__fish_seen_subcommand_from build' -l format -d 'Limit the format to either wheel or sdist.'

# cache:clear
complete -c poetry -A -n '__fish_seen_subcommand_from cache:clear' -l all -d 'Clear all entries in cache.'

# check

# config
complete -c poetry -A -n '__fish_seen_subcommand_from config' -l list -d 'List configuration settings'
complete -c poetry -A -n '__fish_seen_subcommand_from config' -l unset -d 'Unset configuration setting'

# debug:info

# debug:resolve
complete -c poetry -A -n '__fish_seen_subcommand_from debug:resolve' -l extras -d 'Extras to activate for the dependency.'
complete -c poetry -A -n '__fish_seen_subcommand_from debug:resolve' -l install -d 'Show what would be installed for the current system.'
complete -c poetry -A -n '__fish_seen_subcommand_from debug:resolve' -l python -d 'Python version(s) to use for resolution.'
complete -c poetry -A -n '__fish_seen_subcommand_from debug:resolve' -l tree -d 'Displays the dependency tree.'

# develop

# help
complete -c poetry -A -n '__fish_seen_subcommand_from help' -l format -d 'The output format (txt, json, or md)'
complete -c poetry -A -n '__fish_seen_subcommand_from help' -l raw -d 'To output raw command help'

# init
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l author -d 'Author name of the package'
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l dependency -d 'Package to require with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1'
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l description -d 'Description of the package'
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l dev-dependency -d 'Package to require for development with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1'
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l license -d 'License of the package'
complete -c poetry -A -n '__fish_seen_subcommand_from init' -l name -d 'Name of the package'

# install
complete -c poetry -A -n '__fish_seen_subcommand_from install' -l develop -d 'Install given packages in development mode.'
complete -c poetry -A -n '__fish_seen_subcommand_from install' -l dry-run -d 'Outputs the operations but will not execute anything (implicitly enables --verbose).'
complete -c poetry -A -n '__fish_seen_subcommand_from install' -l extras -d 'Extra sets of dependencies to install.'
complete -c poetry -A -n '__fish_seen_subcommand_from install' -l no-dev -d 'Do not install dev dependencies.'

# list
complete -c poetry -A -n '__fish_seen_subcommand_from list' -l format -d 'The output format (txt, json, or md)'
complete -c poetry -A -n '__fish_seen_subcommand_from list' -l raw -d 'To output raw command list'

# lock

# new
complete -c poetry -A -n '__fish_seen_subcommand_from new' -l name -d 'Set the resulting package name.'
complete -c poetry -A -n '__fish_seen_subcommand_from new' -l src -d 'Use the src layout for the project.'

# publish
complete -c poetry -A -n '__fish_seen_subcommand_from publish' -l build -d 'Build the package before publishing.'
complete -c poetry -A -n '__fish_seen_subcommand_from publish' -l password -d 'The password to access the repository.'
complete -c poetry -A -n '__fish_seen_subcommand_from publish' -l repository -d 'The repository to publish the package to.'
complete -c poetry -A -n '__fish_seen_subcommand_from publish' -l username -d 'The username to access the repository.'

# remove
complete -c poetry -A -n '__fish_seen_subcommand_from remove' -l dev -d 'Removes a package from the development dependencies.'
complete -c poetry -A -n '__fish_seen_subcommand_from remove' -l dry-run -d 'Outputs the operations but will not execute anything (implicitly enables --verbose).'

# run

# script

# search
complete -c poetry -A -n '__fish_seen_subcommand_from search' -l only-name -d 'Search only in name.'

# self:update
complete -c poetry -A -n '__fish_seen_subcommand_from self:update' -l preview -d 'Install prereleases.'

# shell

# show
complete -c poetry -A -n '__fish_seen_subcommand_from show' -l all -d 'Show all packages (even those not compatible with current system).'
complete -c poetry -A -n '__fish_seen_subcommand_from show' -l latest -d 'Show the latest version.'
complete -c poetry -A -n '__fish_seen_subcommand_from show' -l no-dev -d 'Do not list the dev dependencies.'
complete -c poetry -A -n '__fish_seen_subcommand_from show' -l outdated -d 'Show the latest version but only for packages that are outdated.'
complete -c poetry -A -n '__fish_seen_subcommand_from show' -l tree -d 'List the dependencies as a tree.'

# update
complete -c poetry -A -n '__fish_seen_subcommand_from update' -l dry-run -d 'Outputs the operations but will not execute anything (implicitly enables --verbose).'
complete -c poetry -A -n '__fish_seen_subcommand_from update' -l lock -d 'Do not perform install (only update the lockfile).'
complete -c poetry -A -n '__fish_seen_subcommand_from update' -l no-dev -d 'Do not install dev dependencies.'

# version
