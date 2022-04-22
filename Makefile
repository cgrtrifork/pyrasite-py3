SHELL := /bin/bash

# this generates a .whl file in dist/ folder
wheel:
	@[[ "$(shell which python3)" =~ venv ]] ; \
	VENV_CODE=$? && \
	if [ ! VENV_CODE ]; then \
		if [ ! -e venv ]; then \
			python3 -m venv venv; \
		fi ; \
	fi && \
	source venv/bin/activate && \
	python3 setup.py build install && \
	if [ ! VENV_CODE ]; then \
		deactivate; \
	fi && \
	wheel convert dist/*.egg -d dist/