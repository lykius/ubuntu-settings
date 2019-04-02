"""
create_sublime_project.py
Create a Sublime Text 3 project in the specified directory,
setting the specified python interpreter.
"""

import json
import os
import sys

HOME = os.path.expanduser('~')
PROJECT_EXT = '.sublime-project'
WORKSPACE_EXT = '.sublime-workspace'
PROJECT_TEMPLATE = HOME + '/.templates/template' + PROJECT_EXT
WORKSPACE_TEMPLATE = HOME + '/.templates/template' + WORKSPACE_EXT

if len(sys.argv) != 3:
    print('Usage: python create_sublime_project.py dir interpreter')
    exit()

if not os.path.isfile(PROJECT_TEMPLATE):
    print('Cannot find a project template file')
    exit()
elif not os.path.isfile(WORKSPACE_TEMPLATE):
    print('Cannot find a workspace template file')
    exit()

project_dir = sys.argv[1]
if not os.path.isdir(project_dir):
    print('Directory \"{0}\" doesn\'t exist'.format(project_dir))
    exit()

project_name = os.path.basename(project_dir)
project_file = os.path.join(project_dir, project_name + PROJECT_EXT)
workspace_file = os.path.join(project_dir, project_name + WORKSPACE_EXT)

try:
    with open(PROJECT_TEMPLATE, 'r') as template:
        with open(project_file, 'w') as file:
            project = json.load(template)
            project['settings']['python_interpreter'] = sys.argv[2]
            json.dump(project, file, indent=4)
except IOError:
    print('IOError on project file (check template and destination)')
except json.JSONDecodeError:
    print('Error while parsing project template file')

try:
    with open(WORKSPACE_TEMPLATE, 'r') as template:
        with open(workspace_file, 'w') as file:
            workspace = json.load(template)
            json.dump(workspace, file, indent=4)
except IOError:
    print('IOError on workspace file (check template and destination)')
except json.JSONDecodeError:
    print('Error while parsing workspace template file')
