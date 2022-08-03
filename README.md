# hillel_05_2022_support

# Support service.


### Setup the environment

#### Install dependencies with Pipenv & activate virtual environment
🔗  [Pipenv official page](https://pipenv.pypa.io/)
```bash
# Install pipenv
pip install --user pipenv

# Install dependencies
pipenv shell
pipenv install -d
```
#### Install [pre-commit hooks](https://pre-commit.com/#install)
> Note: Install pre-commit tool before
```bash
pre-commit install
```
# Files and  folders

### .github/workflows
- GitHub Actions settings for a repository.

### /authentication
- authentication application, models and API for work with users(sing up/in/out).
    - /migrations - migrations uses to create/update tables for apps.
    - admin.py - file is used to display your models in the Django admin panel.
    - models.py -  is the built-in feature that Django uses to create tables, their fields, and various constraints.
    - apps.py - created to help the user include any application configuration for the app.

### /config
- basic project settings:
	- asgi.py - Asynchronous Server Gateway Interface config for config project.
	- settings.py - a core file in Django projects. It holds all the configuration values web app needs to work; database settings, logging configuration, where to find static files/etc.
    - urls.py - define the mapping between URLs and views.
    - wsgi.py - Web Server Gateway Interface config for config project.

### /core
- main application, models and API to work with the main logic of the project(tickets/comments/etc).
    - /migrations - migrations from which tables are created
    - admin.py - file is used to display your models in the Django admin panel.
    - models.py - is the built-in feature that Django uses to create tables, their fields, and various constraints.
    - apps.py - created to help the user include any application configuration for the app.

### /docs
- secondary files to help with development. Now it is a visual representation of the application and databases.

### /shared
- code that is used in other applications, but never uses code from others apps.

### .flake8 
- configuration file to store preferences flake8.
### .gitignore 
- file specifies intentionally untracked files that Git should ignore.
### .pre-commit-config.yaml 
- describes what repositories and hooks are installed.
### Pipfile 
- intended to specify packages requirements for your Python application or library, both to development and execution.
### Pipfile.lock 
- intended to specify, based on the packages present in Pipfile, which specific version of those should be used, avoiding the risks of automatically upgrading packages that depend upon each other and breaking your project dependency tree.
### pyproject.toml 
- configuration file (now uses for isort & black to work without conflicts).
### manage.py
- tool for executing many Django-specific tasks — starting a new app within a project, running the development server, running tests/etc.



