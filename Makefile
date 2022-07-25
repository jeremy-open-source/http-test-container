freeze:
	CUSTOM_COMPILE_COMMAND="make freeze" pip-compile --no-annotate --no-emit-index-url --output-file requirements.txt requirements.in

freeze-upgrade:
	CUSTOM_COMPILE_COMMAND="make freeze" pip-compile --no-annotate --no-emit-index-url --output-file requirements.txt --upgrade requirements.in
