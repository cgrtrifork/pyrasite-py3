SHELL := /bin/bash

# this generates a .whl file in dist/ folder
wheel:
	[[ "$(shell which python3)" =~ venv ]] ; \
	VENV_CODE=$? && \
	if (( ! VENV_CODE )); then \
		if [ ! -d venv ]; then \
			echo "Creating virtual env" && \
			python3 -m venv venv; \
		fi ; \
	fi && \
	source venv/bin/activate && \
	pip install . && \
	if (( ! VENV_CODE )); then \
		deactivate; \
	fi && \
	wheel convert dist/*.egg -d dist/